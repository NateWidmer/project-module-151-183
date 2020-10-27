<?php

// Aufruf Test
// http://localhost/TEST1/RESTfulPHPClientHelloWorld.php


  $url ="http://localhost/location_service_final/RESTfulPHPServiceHelloWorld.php";
// echo $url;
  $client = curl_init($url);
  curl_setopt($client,CURLOPT_RETURNTRANSFER,1);
 
//curl_setopt($client,CURLOPT_POST,$data);
  $response = curl_exec($client); 
  $result = json_decode($response);
  // echo $result;

  echo "Return Message from Web Service Server : $result->result";
?>
