<?php
//process client request (via url)
  header("Content-Type:application/json");
  include("function.php");
  $question = "In which city is the Empire State Building";
  $answer = answerForQuestion($question);
  //$answer="Hello World1";
  if(empty($answer))
 $data = NULL;
else 
 $data = $answer;
  $response['result']= $data;
 
  $json_response = json_encode($response);
  echo $json_response;
 

 
?>
