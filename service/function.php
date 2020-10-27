
<?php
require_once "config.php";
function answerForQuestion($question, $quiz_id)
{
	
	$mysqli = new mysqli('localhost', 'root', '', 'quiz');
	if(!empty($question)) {
		$sql = "SELECT answer FROM questions WHERE question = '$question' AND quiz_id ='$quiz_id'";
		$result = $mysqli->query($sql);
		if($result->num_rows >=1) {
			while ($obj = $result->fetch_object()) {
				$answer = $obj->answer;
			}
		} else {
			$answer = "Question does not exist in the database";
		}
	} 
	else {
		$answer = "Please enter a wonder name";
	}
	return $answer;
}
?>
