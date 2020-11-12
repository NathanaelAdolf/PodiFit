//
//  DefaultDataHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 12/11/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import CoreData

class DefaultDataHelper: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func storeDefaultPlanData()
    {
        planHelper.storeToPlanData(idPlan: 1, namaPlan: "Beginner Leg", idDifficulty: 1, durasiPlan: 4, durasiSessionDay: 30, jumlahHari: 4, totalSessionDone: 0, choosenExercise: [1,2,3,4,5], isPlanDone: false, description: "This plan intended for beginner who like to begin their leg workout")
        planHelper.storeToPlanData(idPlan: 2, namaPlan: "Intermediate Leg", idDifficulty: 2, durasiPlan: 4, durasiSessionDay: 30, jumlahHari: 4, totalSessionDone: 0, choosenExercise: [11,12,13,14,15], isPlanDone: false, description: "This plan intended for intermediate person that have experience before")
    }
    
    func storeDefaultDifficulty()
    {
        difficultyHelper.storeToDifficultyData(idDifficulty: 1, levelDifficulty: "Eazy")
        difficultyHelper.storeToDifficultyData(idDifficulty: 2, levelDifficulty: "Medium")
    }
    
    func storeDefaultExerciseAndExerciseStepsData()
    {
        
        //1
        let newExercise1 = Exercise(context: self.context)
        newExercise1.idDifficulty = 1
        newExercise1.idExercise = 1
        newExercise1.listIdSteps = [1,2,3]
        newExercise1.namaExercise = "Standing Calf Raise"
        newExercise1.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise1.warningData = [1]
        
        let step = ExerciseSteps(context: self.context)
        step.idStep = 1
        step.steps = "Stand up straight"
        
        let step1 = ExerciseSteps(context: self.context)
        step1.idStep = 2
        step1.steps = "Raise your heel until you are standing on your toes"
        
        let step2 = ExerciseSteps(context: self.context)
        step2.idStep = 3
        step2.steps = "Lower slowly back"
        
        newExercise1.steps = NSSet.init(array: [step, step1, step2])
        
        //2
        let newExercise2 = Exercise(context: self.context)
        newExercise2.idDifficulty = 1
        newExercise2.idExercise = 2
        newExercise2.listIdSteps = [4,5,6,7,8]
        newExercise2.namaExercise = "Lunge"
        newExercise2.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise2.warningData = [2]
        
        let step4 = ExerciseSteps(context: self.context)
        step4.idStep = 4
        step4.steps = "Stand up straight, with feet hip width-apart"
        
        let step5 = ExerciseSteps(context: self.context)
        step5.idStep = 5
        step5.steps = "Take a big step forward with your right leg"
        
        let step6 = ExerciseSteps(context: self.context)
        step6.idStep = 6
        step6.steps = "Lower your body until your knee is at 90 degree angle"
        
        let step7 = ExerciseSteps(context: self.context)
        step7.idStep = 7
        step7.steps = "Push yourself upwards with your right foot"
        
        let step8 = ExerciseSteps(context: self.context)
        step8.idStep = 8
        step8.steps = "Repeat or you can swap leg"
        
        newExercise2.steps = NSSet.init(array: [step4, step5,step6, step7, step8])
        
        //3
        let newExercise3 = Exercise(context: self.context)
        newExercise3.idDifficulty = 1
        newExercise3.idExercise = 3
        newExercise3.listIdSteps = [9,10,11,12]
        newExercise3.namaExercise = "In and out squat jumps"
        newExercise3.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise3.warningData = [3]
        
        let step9 = ExerciseSteps(context: self.context)
        step9.idStep = 9
        step9.steps = "Stand with your feet together, placing your hands in front of your thighs"
        
        let step10 = ExerciseSteps(context: self.context)
        step10.idStep = 10
        step10.steps = "Bend your legs, jump up and separate your feet in the air"
        
        let step11 = ExerciseSteps(context: self.context)
        step11.idStep = 11
        step11.steps = "Land with your feet wider than shoulder-width apart, lowering into squat"
        
        let step12 = ExerciseSteps(context: self.context)
        step12.idStep = 12
        step12.steps = "Jump out of the squat and land back in the starting position, bringing your feet together on."
        
        newExercise3.steps = NSSet.init(array: [step9, step10,step11, step12])
        
        //4
        let newExercise4 = Exercise(context: self.context)
        newExercise4.idDifficulty = 1
        newExercise4.idExercise = 4
        newExercise4.listIdSteps = [1,13,14,15,8]
        newExercise4.namaExercise = "Side Step Squat"
        newExercise4.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise4.warningData = [4]
        
        let step13 = ExerciseSteps(context: self.context)
        step13.idStep = 13
        step13.steps = "With your right food take a wide step out to the right"
        
        let step14 = ExerciseSteps(context: self.context)
        step14.idStep = 14
        step14.steps = "Squat down"
        
        let step15 = ExerciseSteps(context: self.context)
        step15.idStep = 15
        step15.steps = "As you straighten your legs,step your right foot back in."
        
        newExercise4.steps = NSSet.init(array: [step13, step14,step15])
        
        //5
        let newExercise5 = Exercise(context: self.context)
        newExercise5.idDifficulty = 1
        newExercise5.idExercise = 5
        newExercise5.listIdSteps = [16,17,18,19]
        newExercise5.namaExercise = "Lateral lunge"
        newExercise5.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise5.warningData = [5]
        
        let step16 = ExerciseSteps(context: self.context)
        step16.idStep = 16
        step16.steps = "Stand with your feet parallel and shoulder width apart, your back should be straight"
        
        let step17 = ExerciseSteps(context: self.context)
        step17.idStep = 17
        step17.steps = "Take a big step to the side"
        
        let step18 = ExerciseSteps(context: self.context)
        step18.idStep = 18
        step18.steps = "Lower until the knee of your leading leg is bent at around 90 degree, keeping your trailing leg straight"
        
        let step19 = ExerciseSteps(context: self.context)
        step19.idStep = 19
        step19.steps = "Push back up and return to the starting position"
        
        newExercise5.steps = NSSet.init(array: [step16, step17,step18,step19])
        
        //6
        let newExercise6 = Exercise(context: self.context)
        newExercise6.idDifficulty = 1
        newExercise6.idExercise = 6
        newExercise6.listIdSteps = [20,21,19]
        newExercise6.namaExercise = "Kneeling Squat"
        newExercise6.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise6.warningData = [6]
        
        let step20 = ExerciseSteps(context: self.context)
        step20.idStep = 20
        step20.steps = "Start by kneeling on your knee, make sure your knee opened as your shoulder width apart and your back is straight"
        
        let step21 = ExerciseSteps(context: self.context)
        step21.idStep = 21
        step21.steps = "Slowly lower down your body until it touch your feet"
        
        newExercise6.steps = NSSet.init(array: [step20, step21])
        
        //7
        let newExercise7 = Exercise(context: self.context)
        newExercise7.idDifficulty = 1
        newExercise7.idExercise = 7
        newExercise7.listIdSteps = [22,23,24,25,26]
        newExercise7.namaExercise = "Jumping Jack"
        newExercise7.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise7.warningData = [7]
        
        let step22 = ExerciseSteps(context: self.context)
        step22.idStep = 22
        step22.steps = "stand upright with your legs together and your arm at your sides"
        
        let step23 = ExerciseSteps(context: self.context)
        step23.idStep = 23
        step23.steps = "bend your knee slightly and jump into the air"
        
        let step24 = ExerciseSteps(context: self.context)
        step24.idStep = 24
        step24.steps = "as you jump, spread your legs to be about shoulder width apart. Stretch your arm out and over your head"
        
        let step25 = ExerciseSteps(context: self.context)
        step25.idStep = 25
        step25.steps = "jump back to starting position"
        
        let step26 = ExerciseSteps(context: self.context)
        step26.idStep = 26
        step26.steps = "Repeat"
        
        newExercise7.steps = NSSet.init(array: [step22,step23,step24,step25,step26])
        
        //8
        let newExercise8 = Exercise(context: self.context)
        newExercise8.idDifficulty = 1
        newExercise8.idExercise = 8
        newExercise8.listIdSteps = [27,28,29,30]
        newExercise8.namaExercise = "Mountain climber"
        newExercise8.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise8.warningData = [8]
        
        let step27 = ExerciseSteps(context: self.context)
        step27.idStep = 27
        step27.steps = "Put both hands and knees on the floor."
        
        let step28 = ExerciseSteps(context: self.context)
        step28.idStep = 28
        step28.steps = "Place your right foot near your right hand and extend your left leg behind you."
        
        let step29 = ExerciseSteps(context: self.context)
        step29.idStep = 29
        step29.steps = "In one smooth motion, switch your legs, keeping your arms in the same position."
        
        let step30 = ExerciseSteps(context: self.context)
        step30.idStep = 30
        step30.steps = "Switch your legs back and forth twice, such that your right leg is again close to your right hand."
        
        newExercise8.steps = NSSet.init(array: [step27,step28,step29,step30])
        
        //9
        let newExercise9 = Exercise(context: self.context)
        newExercise9.idDifficulty = 1
        newExercise9.idExercise = 9
        newExercise9.listIdSteps = [31,32,33,8]
        newExercise9.namaExercise = "Side to side Plié"
        newExercise9.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise9.warningData = [9]
        
        let step31 = ExerciseSteps(context: self.context)
        step31.idStep = 31
        step31.steps = "Start by standing with feet wider than shoulder width"
        
        let step32 = ExerciseSteps(context: self.context)
        step32.idStep = 32
        step32.steps = "Slowly lean down"
        
        let step33 = ExerciseSteps(context: self.context)
        step33.idStep = 33
        step33.steps = "Then get up by raising your leg thighs"
        
        newExercise9.steps = NSSet.init(array: [step31,step32,step33])
        
        //10
        let newExercise10 = Exercise(context: self.context)
        newExercise10.idDifficulty = 1
        newExercise10.idExercise = 10
        newExercise10.listIdSteps = [34,35,36]
        newExercise10.namaExercise = "Glute Bridge"
        newExercise10.videoUrl = "https://www.youtube.com/embed/xXRU28mfIJQ?playsinline=1"
        newExercise10.warningData = [10]
        
        let step34 = ExerciseSteps(context: self.context)
        step34.idStep = 34
        step34.steps = "Lie face up on the floor, with your knees bent and your arms at your side with palms down"
        
        let step35 = ExerciseSteps(context: self.context)
        step35.idStep = 35
        step35.steps = "Lift your hips off the ground until your knees, hips and shoulder form a straight line"
        
        let step36 = ExerciseSteps(context: self.context)
        step36.idStep = 36
        step36.steps = "Hold your bridged position for a couple of seconds before easing back down"
        
        newExercise10.steps = NSSet.init(array: [step34,step35,step36])
        
        //mulai aldo punya
        
    
    }
}