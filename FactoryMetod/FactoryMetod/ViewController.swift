//
//  ViewController.swift
//  FactoryMetod
//
//  Created by mac on 26.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var exercisesArray = [Exercise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createExercises(exName: .jumping)
        createExercises(exName: .squarts)
        createExercises(exName: .swingPress)
        runExercise()
    }
    //!!!! Создаем собственно фабричный метод
    func createExercises (exName: Exercises){
        let newExercise = FactoryExercises.defaultFactory.createExercises(name: exName)
        exercisesArray.append(newExercise)
    }
    func runExercise () {
        for ex in exercisesArray {
            ex.start()
            ex.stop()
        }
    }
}

