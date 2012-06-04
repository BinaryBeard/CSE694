#pragma strict

function Start () {

}

function Update() {

	this.guiTexture.pixelInset.width = Screen.width*.2;
	this.guiTexture.pixelInset.height = Screen.width*.2;
	this.guiTexture.pixelInset.xMin = Screen.width/2 - (Screen.width*.2) - 50;
	this.guiTexture.pixelInset.yMin = Screen.height/6;

	if (Input.touchCount == 1) {
   
   		var touch: Touch = Input.touches[0]; 

   		if(touch.phase == TouchPhase.Began && guiTexture.HitTest(touch.position)) {

			PauseGame();
      	}
   	}
}

function OnMouseDown() {

	PauseGame();
}

function PauseGame() {
	
	Debug.Log("Retry Pressed");
	Application.LoadLevel("Pause");
}
