#pragma strict

function Start () {

}

function Update() {

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