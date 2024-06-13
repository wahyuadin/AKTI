<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

http_response_code(400);
                $response = array(
                    'status' => 'error',
                    'message' => 'File Asset Tidak Boleh di akses'
                );
                echo json_encode($response);
                exit;
