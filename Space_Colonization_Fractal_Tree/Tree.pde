class Tree {
   
  ArrayList<Leaf> leaves = new ArrayList<Leaf>();
  ArrayList<Branch> branches = new ArrayList<Branch>();
  int MAX = 1000;
  
  Tree()
  {
    // Creating all Leaves
   for(int i=0;i<MAX;i++)
     leaves.add(new Leaf());
     
    // Creating Trunk of the tree
    /*
     At Bottom
    PVector pos = new PVector(width/2,height);
     At Center
    PVector pos = new PVector(width/2,height/2);
    */
    // At Center with PeasyCam
    //PVector pos = new PVector(0,0);
    // At Bottom with PeasyCam
    PVector pos = new PVector(0,height/2 );
    PVector dir = new PVector(0,-1);  
    Branch root = new Branch(null,pos,dir);
    branches.add(root);
    
    // Initially we have only one branch so we need to make sure that this branch is atleast at max_dist from any leaf to start algo
    Branch current = root;
    boolean found = false;
    
    while(!found)
    {
    for(Leaf leaf : leaves)
      {
        float d = PVector.dist(current.pos,leaf.pos);
        if(d < MAX_DIST)
        {
          found = true;
        }
      }
      // If it is not found we will create new branch and hope to find it again
      if(!found)
      {
        Branch newBranch = current.next();
        current = newBranch;
        branches.add(current);
      }
    }
    
  }
  
  void show()
  {
    noStroke();
    fill(255);
    for(Leaf leaf : leaves)
    {
      leaf.show();
    }
    stroke(255);
    /*
    for(Branch branch : branches)
    {
      branch.show();
    }
    */
    // Adding Thickness
    for(int i=0;i<branches.size();i++)
    {
      Branch branch = branches.get(i); 
      float sw = map(i,0,branches.size(),5,0);
      strokeWeight(sw);
      branch.show();
    }
  }
  
  void grow()
  {
    
    
    // Pair of leaf and branch
    for(Leaf leaf : leaves )
    {
      
      Branch closestBranch = null;
      float record = Float.POSITIVE_INFINITY;
      // Finding closestBranch
      for(Branch branch : branches)
      {
         float dist = PVector.dist(leaf.pos,branch.pos);
         // Too close leaf should be removed
         if(dist < MIN_DIST)
         {
           leaf.reached = true;
           closestBranch = null;
           break;
           // From this leaf we need not to check any other branch
         }
         else
         if(dist > MAX_DIST)
         {
           // From this leaf check for another branch so no break
         }
         else
         if(closestBranch == null || dist < record)
         {
           closestBranch = branch;
           record = dist;
         }
      }
        // Creating new Branch if leaf have closestBranch
        if(closestBranch != null)
        {
          PVector newDir = PVector.sub(leaf.pos,closestBranch.pos);
          newDir.normalize();
          closestBranch.dir.add(newDir);
          closestBranch.count++;
        }
    }
    
    // Removing Leaf that we too close
    for(int i = leaves.size()-1;i>=0;i--)
    {
      Leaf leaf = leaves.get(i);
      if(leaf.reached)
        leaves.remove(i);     
    }
    
    // Creating branch from branch that we closest to any leaf
    for(int i = branches.size()-1;i>=0;i--)
    {
      Branch branch = branches.get(i);
      if(branch.count>0)
        {
          branch.dir.div(branch.count+1);
          PVector rand  = PVector.random2D();
          rand.mult(0.3);
          branch.dir.add(rand);
          
          branch.dir.normalize();
          branches.add(branch.next());
        } 
          branch.reset();
    }
    
  }
  
}
