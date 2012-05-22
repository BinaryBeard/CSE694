#pragma strict

function Start () {

}

function Update () {

	this.guiTexture.pixelInset.xMin = -Screen.width/2;
	this.guiTexture.pixelInset.yMin = -Screen.height/2;
	
	this.guiTexture.pixelInset.width = Screen.width;
	this.guiTexture.pixelInset.height = .75*(Screen.width);

}