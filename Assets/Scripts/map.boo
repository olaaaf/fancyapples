import UnityEngine

class map(MonoBehaviour):
   private time as double
   private gen_time = 1.25
   private generate_allow = true
   public apple1 as GameObject
   public score as int
   public gen_time_max = 1.25
   public gen_time_min = 0.8
   public time_to_min = 20
   private minus_per_second  = (gen_time - gen_time_min) /20

   public def StartGame():
      animator = GameObject.Find("rect").GetComponent[of Animator]()
      animator.Rebind()
      animator.speed = -1
      animator.Play("go_down")
      generate()
      generate_allow = true

   public def Pause():
      return

   public def GameOver():
      animator = GameObject.Find("rect").GetComponent[of Animator]()
      animator.Rebind()
      animator.speed = 1
      animator.Play("go_down")
      time = 0
      gen_time = gen_time_max
      generate_allow = false
      GameObject.Find("Canvas/Score").GetComponent[of UnityEngine.UI.Text]().text = ""+score
      if PlayerPrefs.GetInt("HighScore", 0) < score:
         PlayerPrefs.SetInt("HighScore", score)
      GameObject.Find("Canvas/HighScore").GetComponent[of UnityEngine.UI.Text]().text = ""+PlayerPrefs.GetInt("HighScore")
      score = 0

   private def generate():
      if (GameObject.Find("apple1(Clone)") != null):
         return time
      y = Random.Range(GameObject.Find("area").transform.localScale.y * 2.085F, -GameObject.Find("area").transform.localScale.y * 2.085F)
      i = Instantiate(apple1, Vector3(Random.Range(y * 1.33093F, -y * 1.33093F) + GameObject.Find("area").transform.position.x, y + 1 + GameObject.Find("area").transform.position.y, 0), Quaternion.identity)
      i.GetComponent[of Rigidbody2D]().gravityScale = gen_time_min / (gen_time+1.25) + 0.75
      return 0

   private def Update():
      if generate_allow:
         time += Time.deltaTime
         if (gen_time > gen_time_min+minus_per_second*Time.deltaTime):
            gen_time -= minus_per_second*Time.deltaTime
         else:
            gen_time = gen_time_min

         if (time >= gen_time):
            time = generate()
