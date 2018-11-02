
class AniSprite
{
  PImage[] ani;
  int frame;
  int numFrames;
  int lastMillis=0;
  
  AniSprite(String imageName, int frameCount) {
    numFrames = frameCount;
    ani = new PImage[numFrames];
    loadImages(imageName);
  }

  void loadImages(String name) {
    for(int i=0; i<numFrames; i++) {
      String imageName = name + ((i < 10) ? "0" : "") + i + ".png";
      ani[i] = loadImage(imageName);
      ani[i].resize(30,60);
     
     
    }
  }

  void display(float xpos, float ypos)
  {
    //frame = (frame+1)%numFrames;
    //image(ani[frame], xpos, ypos);
    //    frame = (frame+1)%numFrames;
//you're increasing the frame even if it's not time to do so..
    int del = 100;
    if(lastMillis==0 || millis() > (lastMillis+del))
    {
 image(ani[frame], xpos, ypos);
 lastMillis= millis();
//put it here
  frame = (frame+1)%numFrames;
    }
//you need to draw the previous one if it's not update time
    else
    {
  image(ani[frame], xpos, ypos);
    }
  }
  
  int getWidth() {
    return ani[0].width;
  }

}