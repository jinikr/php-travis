<?php
namespace App\Models;

use Phalcon\Mvc\Model;

class Test extends Model
{
    public function selectAll()
    {
        $sql = "SELECT * FROM property";

        return $this->getDI()->get('db')->fetchAll($sql);
    }
}
