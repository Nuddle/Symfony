<?php
namespace App\DataFixtures;

  use App\Entity\Pokemon;
  use  App\Entity\Type;
  use Doctrine\Bundle\FixturesBundle\Fixture;
  use Doctrine\Common\Persistence\ObjectManager;

  class PokemonFixtures extends Fixture
  {
    public function load(ObjectManager $manager)
    {
      foreach ($this->getPokemons() as [$name,$type,$HP,$attack]) {
        $pokemon = new Pokemon;
        $pokemon
          ->setName($name)
          ->setType($type)
          ->setHP($HP)
          ;
          for ($i=0; $i < sizeof($attack) ; $i++) {
            $pokemon->addAttack($attack[$i]);
          }

        $manager->persist($pokemon);
        $reference = $this->addReference($name,$pokemon);
      }

      $manager->flush();
    }

    public function getPokemons()
    {
      // [name,type,HP,attack]
      return[
        ['Ouisticram',Type::TYPE_FIRE,200,[$this->getReference('Billic'),$this->getReference('Charge')]],
        ['Tiplouf',Type::TYPE_WATER,200,[$this->getReference('Volvic'),$this->getReference('Charge')]],
        ['Tortipouss',Type::TYPE_PLANT,200,[$this->getReference('Agriculture'),$this->getReference('Charge')]]
      ];
    }
  }

  ?>
