<?php

class Lift {

  protected $button = array('1','2','3','4','5','6','7','8','9');
  protected $man;
  protected $pass_level;
  protected $first_level;

  
    function __construct( $pass_level, $first_level ) {
        $this->pass_level = $pass_level;
        $this->first_level = $first_level;
    }


    function call( Engine $engine, Doors $doors )
    {
        if ($engine->engine_state == 1 ) {
            echo 'Лифт поломан ';
            exit();
        } else {
            if ($this->pass_level - $this->first_level != 0) {
                echo 'Лифт в пути ';
                $doors->doors_open_close = 1;
                $this->check_doors($doors);
                $this->close_doors($doors);
            } else {
                echo 'Лифт в режиме ожидания ';
                $doors->doors_open_close = 1;
                $this->check_doors($doors);
                $this->close_doors($doors);
            }
        }
    }


    function check_doors ( Doors $doors ) {
        if ( $doors->doors_state == 0 ) {
          if ( $doors->doors_open_close == 1 ) {
              echo 'Двери открываются ';
          }

          if ( $doors->doors_open_close == 2 ) {
              echo 'Двери закрываются ';
          }
        } else {
            echo 'Двери поломаны';
            exit;
        }
    }

    function open_doors ( Doors $doors ) {
        $doors->doors_open_close == 1;
        echo 'Двери открываются ';
    }

    function close_doors ( Doors $doors ) {
        $doors->doors_open_close == 2;
        echo 'Двери закрываются ';
    }

    function action( Man $man, Doors $doors ) {
    $this->man = $man;

    if( $this->man ) {

      if( in_array($this->man->button, $this->button) ) {

        if( $this->pass_level < $this->man->button) {
          $this->rise($this->man->button);
          $this->open_doors($doors);
          $this->close_doors($doors);
        }
        elseif( $this->pass_level > $this->man->button) {
          $this->fall($this->man->button);
          $this->open_doors($doors);
          $this->close_doors($doors);
        }
        else {
          echo 'Стоим на месте! ';
          return false;
        }

      } else {
        echo 'Такой кнопки не существует! ';
        return false;
      }

    } else {
      return false;
    }
  }

  function rise() {
      echo 'Лифт поднимается на ' . $this->man->button . ' этаж! ';
  }

  function fall() {
      echo 'Лифт опускается на ' . $this->man->button . ' этаж! ';
  }

}

class Engine {
    public $engine_state = 0;
}

class Doors {
    public $doors_state = 0;
    public $doors_open_close = 1;
}

class Man {

  public $button;

  function press_button( $number, Lift $lift, Doors $doors ) {
    $this->button = $number;
    $lift->action($this, $doors);
  }

}


$lift = new Lift(4, 6);
$man = new Man();
$engine = new Engine();
$doors = new Doors();
$lift->call($engine, $doors);
$man->press_button( '9', $lift, $doors );