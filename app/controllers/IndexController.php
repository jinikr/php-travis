<?php

namespace App\Controllers;

use Phalcon\Mvc\Controller;
use App\Models\Test;

class IndexController extends Controller
{

    public function indexAction()
    {
        return "<h1>Hello!</h1>";
    }

    public function testAction()
    {
        $test = new Test();
        return $this->response->setJsonContent($test->selectAll());
    }
}
