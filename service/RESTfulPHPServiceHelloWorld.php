<?php
//process client request (via url)
  header("Content-Type:application/json");
  include("function.php");
  $question = "Haupststadt von Kanton Zuerich?";
  $quiz_id = "1";
  $answer = answerForQuestion($question, $quiz_id);
  if(empty($answer))
 $data = NULL;
else 
 $data = $answer;
  $response['result']= $data;
 
  $json_response = json_encode($response);
  echo $json_response;
 

 
?>
