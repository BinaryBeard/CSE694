#pragma strict

var resumeStyle : GUIStyle;

var hSliderValue : float = 2.0;

function Start () {

}

function Update () {

    if (GameObject.Find("Canon_System")) {
    
    	Debug.Log("System Found");
    }
}

function OnGUI() {

    if (GUI.Button (Rect (Screen.width/9,Screen.height/2 + Screen.height/5,Screen.width/5,Screen.width/5), "", resumeStyle)) {
    	Application.LoadLevel("Scene");
    }
    
    hSliderValue = GUI.HorizontalSlider (Rect (200, 100, 500, 40), hSliderValue, 0.1, 27.0);

	GUI.Label (Rect(200, 300, 200, 50), hSliderValue.ToString());
}