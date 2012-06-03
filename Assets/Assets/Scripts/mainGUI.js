#pragma strict

var startStyle : GUIStyle;
var howToStyle : GUIStyle;


function Start () {

}

function Update () {

}

function OnGUI () {

    if (GUI.Button (Rect (Screen.width/9,Screen.height/2 - Screen.height/12,Screen.width/5,Screen.width/5),"",startStyle)) {    
        Application.LoadLevel("Scene");
    }
    if (GUI.Button (Rect (Screen.width/9,Screen.height/2 + Screen.height/5,Screen.width/5,Screen.width/5), "", howToStyle)) {
    	Application.LoadLevel("HowToPlay");
    }
}