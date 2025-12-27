class Scores
{
 String[] topTenScores;
 boolean added;

  Scores()
{
  topTenScores = loadStrings("10 Highest Scores.txt");
  if (topTenScores == null || topTenScores.length == 0) 
  {
    topTenScores = new String[10];
    for (int i = 0; i < 10; i++) 
    {
      topTenScores[i] = "0"; 
    }
  }
}



void addScore(String newScore)
{
  int scoreInt = int(newScore);
  if(scoreInt>int(topTenScores[9]))
  {
    
    for(int i=9;i>=0;i--)
    {
    if (topTenScores[i].equals("0"))
    {
     topTenScores[i]=newScore;
     sortScores();
     return;
    }
    }
    topTenScores[9]=newScore;
    sortScores();
    return;
    }
  return;
}


      void sortScores()
    {
        Boolean sorted;
        //loop through array
        for(int i=0;i<topTenScores.length;i++)
        {
            //assume the array is sorted
            sorted=true;
            //for each remaining element of the array
            for(int j=1; j< topTenScores.length-i;j++)
            {
                //if the element is less than the previous one
                if(int(topTenScores[j]) > int(topTenScores[j - 1]))
                {
                    //the array is not sorted
                    sorted=false;
                    //store the current element value
                    String temp = topTenScores[j];
                    //swap the value of the current element with that of the previous
                    topTenScores[j]= topTenScores[j -1];
                    //swap the value of the previous element with temp
                    topTenScores[j-1] = temp;
                }
            }
                if(sorted)
                {
                    saveStrings(dataPath("10 Highest Scores.txt"), topTenScores);
                    return;
                }
        }
    }
}
