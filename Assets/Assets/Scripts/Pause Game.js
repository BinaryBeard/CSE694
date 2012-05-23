#pragma strict

function Start () {

}

function Update() {

	this.guiTexture.pixelInset.width = Screen.width*.1;
	this.guiTexture.pixelInset.height = Screen.width*.1;
	this.guiTexture.pixelInset.xMin = Screen.width - (Screen.width*.11);
	this.guiTexture.pixelInset.yMin = Screen.height - (Screen.width*.11);

	if (Input.touchCount==0) {
   
   		var touch: Touch = Input.touches[0]; 

   		if(touch.phase == TouchPhase.Began && guiTexture.HitTest(touch.position)) {

			PauseText();
            Debug.Log("Button Pressed");
      	}
   	}
}

function OnMouseDown() {
	PauseText();
	Debug.Log("Button Pressed");
}

function PauseText() {
	GameObject.Find("PauseText").guiText.text = "Paused";
}