<?php

namespace App\Controllers;

use Phalcon\Mvc\Controller;

class IndexController extends Controller
{

    public function indexAction()
    {
        return "<h1>Hello! PHP</h1>";
    }
}
