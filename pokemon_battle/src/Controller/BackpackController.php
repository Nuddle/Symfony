<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class BackpackController extends AbstractController
{
    /**
     * @Route("/backpack", name="backpack")
     */
    public function index()
    {
        return $this->render('backpack/index.html.twig', [
            'controller_name' => 'BackpackController',
        ]);
    }
}
