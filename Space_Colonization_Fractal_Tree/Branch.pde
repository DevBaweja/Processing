class Branch {
  Branch parent;
  PVector pos;
  PVector dir;
  int count;
  PVector copyDir;
  int len;
  
  Branch(Branch parent,PVector pos,PVector dir)
  {
    this.parent = parent;
    this.pos = pos;
    this.dir = dir;
    count = 0;
    copyDir = dir.copy();
    len = 5;
  }
  
  void show()
  {
    //glitter();
    if(this.parent != null)
    {
      line(this.pos.x,this.pos.y,this.pos.z,this.parent.pos.x,this.parent.pos.y,this.parent.pos.z);
    }
  }
  
  Branch next()
  {  
     PVector nextDir = PVector.mult(dir.copy(),len);
     PVector nextPos = PVector.add(this.pos,nextDir);
     Branch nextBranch = new Branch(this,nextPos,dir.copy());
     return nextBranch;
  }
  
  void glitter()
  {
    PVector rand = PVector.random3D();
    rand.mult(0.1);
    pos = pos.add(rand);
  }
  
  void reset()
  {
    this.count = 0;
    this.dir = this.copyDir.copy();
  }
  
}
