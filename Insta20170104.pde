import de.voidplus.leapmotion.*;

import java.util.*;
import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;
ArrayList<Particle> particles;
Box box;

void setup()
{
  size(720, 720);
  background(0);
  frameRate(30);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  particles = new ArrayList<Particle>();
  box = new Box();
}

void draw()
{
  fill(0, 128);
  noStroke();
  rect(0, 0, width, height);
  box2d.step();
  
  if(frameCount % 1 == 0)
  {
    float x = 300 * cos(radians(frameCount % 360));
    float y = 300 * sin(radians(frameCount % 360));
    
    Particle p = new Particle(width / 2, height / 2, 15);
    p.body.setLinearVelocity(new Vec2(x, y));
    particles.add(p);
  }
  
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.display();
    
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 2500)
  {
     exit();
  }
  */
}