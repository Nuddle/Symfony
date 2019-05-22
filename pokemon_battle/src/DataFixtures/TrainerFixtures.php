<?php
namespace App\DataFixtures;

 use App\Entity\Trainer;
 use Doctrine\Bundle\FixturesBundle\Fixture;
 use Doctrine\Common\Persistence\ObjectManager;

 class TrainerFixtures extends Fixture
 {
   public function load(ObjectManager $manager)
   {
     foreach ($this->getTrainers() as [$name,$roles,$password,$starter]) {
       $trainer = new trainer;
       $trainer
         ->setName($name)
         ->setRoles($roles)
         ->setPassword($password)
         ->setStarterAt($starter)
         ;
       $manager->persist($trainer);
       $reference = $this->addReference($name,$trainer);
     }

     $manager->flush();
   }

   public function getTrainers()
   {
     // [name,roles,password]
     return[
       ['Admin',['ROLE_ADMIN'],'Admin',null],
       ['Sacha',['ROLE_USER'],'OndineLove',null]
     ];
   }
 }

 ?>
