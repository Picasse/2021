using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using System.IO.Ports; // Librería para uso del puerto COM
using System.Threading; // Librería para crear un hilo de ejecución

public class Done_GameController : MonoBehaviour
{
	public string receivedstring; // Datos recibidos
	private string[] datos; // Arreglo para los datos separados
	public Vector3 serial; // Vector con los dos datos
	SerialPort stream = new SerialPort("COM7", 9600);
	Thread serialReadThread = null; // Hilo que va a leer el puerto


	public GameObject[] hazards;
	public Vector3 spawnValues;
	public int hazardCount;
	public float spawnWait;
	public float startWait;
	public float waveWait;
	public UnityEngine.UI.Text scoreText;
	public UnityEngine.UI.Text restartText;
	public UnityEngine.UI.Text gameOverText;
	private bool gameOver;
	private bool restart;
	private int score;
	
	void Start ()
	{
		stream.Open(); // Abrir la comunicación
		serialReadThread = new Thread(new ThreadStart(serialReadLine)); // Iniciar el hilo
		serialReadThread.IsBackground = true; // Ejecutar el hilo en segundo plano
		Debug.Log("inicio"); // Verificación de la comunicación
		serialReadThread.Start();
		gameOver = false;
		restart = false;
		//restartText.text = ""; //jaja
		//gameOverText.text = ""; //jaja
		score = 0;
		UpdateScore ();
		StartCoroutine (SpawnWaves ());
	}

	public void OnApplicationQuit() // Cerrar la comunicación y terminar el hilo
	{
		if (serialReadThread != null)
		{
			if (serialReadThread.IsAlive)
			{
				serialReadThread.Abort();
			}
		}
		if (stream != null)
		{
			if (stream.IsOpen)
			{
				print("closing serial port");
				stream.Close();
			}
			stream = null;
		}
	}

	public void serialReadLine() // Función para leer el puerto
	{
		while (true)
		{
            try
            {
				receivedstring = stream.ReadLine().ToString(); // Lectura del puerto
				string[] datos = receivedstring.Split('*'); // La cadena leída se parte en bloques separados por ;
				serial[0] = float.Parse(datos[0]); // Se convierte el dato 0 en float y se almacena en el vector
				serial[1] = float.Parse(datos[1]); // Se convierte el dato 1 en float y se almacena en el vector
				serial[2] = float.Parse(datos[2]); // Se convierte el dato 1 en float y se almacena en el vector
			}
            catch
            {

            }
		}
	}

	void Update ()
	{
		if (restart)
		{
			if (Input.GetKeyDown (KeyCode.R))
			{
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
			}
		}
	}
	
	IEnumerator SpawnWaves ()
	{
		yield return new WaitForSeconds (startWait);
		while (true)
		{
			for (int i = 0; i < hazardCount; i++)
			{
				GameObject hazard = hazards [Random.Range (0, hazards.Length)];
				Vector3 spawnPosition = new Vector3 (Random.Range (-spawnValues.x, spawnValues.x), spawnValues.y, spawnValues.z);
				Quaternion spawnRotation = Quaternion.identity;
				Instantiate (hazard, spawnPosition, spawnRotation);
				yield return new WaitForSeconds (spawnWait);
			}
			yield return new WaitForSeconds (waveWait);
			
			if (gameOver)
			{
				restartText.text = "Press 'R' for Restart";
				restart = true;
				break;
			}
		}
	}
	
	public void AddScore (int newScoreValue)
	{
		score += newScoreValue;
		UpdateScore ();
	}
	
	void UpdateScore ()
	{
		//scoreText.text = "Score: " + score;
	}
	
	public void GameOver ()
	{
		gameOverText.text = "Game Over!";
		gameOver = true;
	}
}