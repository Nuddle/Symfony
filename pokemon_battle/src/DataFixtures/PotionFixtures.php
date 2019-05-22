<?php
namespace App\DataFixtures;

  use App\Entity\Potion;
  use  App\Entity\Type;
  use Doctrine\Bundle\FixturesBundle\Fixture;
  use Doctrine\Common\Persistence\ObjectManager;

  class PotionFixtures extends Fixture
  {
    public function load(ObjectManager $manager)
    {
      foreach ($this->getPotions() as [$name,$strength]) {
        $potion = new potion;
        $potion
          ->setName($name)
          ->setStrength($strength)
          ;

        $manager->persist($potion);
        $reference = $this->addReference($name,$potion);
      }

      $manager->flush();
    }

    public function getPotions()
    {
      // [name,strength]
      return[
        ['Potion',20],
        ['Super Potion',50],
        ['Hyper Potion',100]
      ];
    }
  }

  ?>
