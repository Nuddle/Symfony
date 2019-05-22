<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PokemonRepository")
 */
class Pokemon extends Base
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $Name;

    /**
     * @ORM\Column(type="smallint")
     */
    private $Type;

    /**
     * @ORM\Column(type="integer")
     */
    private $HP;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Attack")
     */
    private $Attack;


    public function __construct()
    {
      parent::__construct();
      $this->Attack = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->Name;
    }

    public function setName(string $Name): self
    {
        $this->Name = $Name;

        return $this;
    }

    public function getType(): ?int
    {
        return $this->Type;
    }

    public function setType(int $Type): self
    {
        $this->Type = $Type;

        return $this;
    }

    public function getHP(): ?int
    {
        return $this->HP;
    }

    public function setHP(int $HP): self
    {
        $this->HP = $HP;

        return $this;
    }

    /**
     * @return Collection|Attack[]
     */
    public function getAttack(): Collection
    {
        return $this->Attack;
    }

    public function addAttack(Attack $attack): self
    {
        if (!$this->Attack->contains($attack)) {
            $this->Attack[] = $attack;
        }

        return $this;
    }

    public function removeAttack(Attack $attack): self
    {
        if ($this->Attack->contains($attack)) {
            $this->Attack->removeElement($attack);
        }

        return $this;
    }
}
