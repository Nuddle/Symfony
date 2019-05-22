<?php
  namespace App\Entity;
  class Type
  {
    const TYPE_PLANT = 1;
    const TYPE_FIRE = 2;
    const TYPE_WATER = 3;
    const TYPE_NORMAL = 4;


    public function isTypeWeakAgainst($typeDefender,$typeAttacker)
    {
      if ($typeDefender === self::TYPE_FIRE) {
        return (self::TYPE_WATER === $typeAttacker) ? true : false;
      } elseif ($typeDefender === self::TYPE_PLANT){
        return (self::TYPE_FIRE === $typeAttacker) ? true : false;
      } elseif ($typeDefender === self::TYPE_WATER){
        return (self::TYPE_PLANT === $typeAttacker) ? true : false;
      }else {return false;}
    }

    public function isStrongAgainst($typeDefender,$typeAttacker)
    {
      switch ($typeAttacker) {
        case self::TYPE_FIRE:
          return (self::TYPE_PLANT === $typeAttacker) ? true : false;
          break;

        case self::TYPE_PLANT:
          return (self::TYPE_WATER === $typeAttacker) ? true : false;
          break;

        case self::TYPE_WATER:
          return (self::TYPE_FIRE === $typeAttacker) ? true : false;
          break;

        default:
          return false;
          break;

      }

    }
  }
 ?>
