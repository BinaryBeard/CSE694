#pragma strict

function Start () {

}

function Update() {

	this.guiTexture.pixelInset.width = Screen.width*.1;
	this.guiTexture.pixelInset.height = Screen.width*.1;
	this.guiTexture.pixelInset.xMin = Screen.width - (Screen.width*.11);
	this.guiTexture.pixelInset.yMin = Screen.height - (Screen.width*.11);

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
	
	Debug.Log("Pause Pressed");
	Application.LoadLevel("Pause");
}
