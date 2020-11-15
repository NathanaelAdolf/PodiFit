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
        newExercise1.namaExercise = "Standing calf raise"
        newExercise1.videoUrl = "https://www.youtube.com/embed/TPa6gvdpi_A?playsinline=1"
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
        

        let warning1 = Warning(context: self.context)
        warning1.idWarning = 1
        warning1.warningText = "Push evenly through the entire width of your foot."
        
        newExercise1.steps = NSSet.init(array: [step, step1, step2])
        newExercise1.warning = NSSet.init(array: [warning1])

        
        //2
        let newExercise2 = Exercise(context: self.context)
        newExercise2.idDifficulty = 1
        newExercise2.idExercise = 2
        newExercise2.listIdSteps = [4,5,6,7,8]
        newExercise2.namaExercise = "Lunge"
        newExercise2.videoUrl = "https://www.youtube.com/embed/sIy8c-172-M?playsinline=1"
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
        
        let warning2 = Warning(context: self.context)
        warning2.idWarning = 2
        warning2.warningText = "Take smaller steps as you lunge to prevents injury."
        
        newExercise2.steps = NSSet.init(array: [step4, step5, step6, step7, step8])
        newExercise2.warning = NSSet.init(array: [warning2])
        
        //3
        let newExercise3 = Exercise(context: self.context)
        newExercise3.idDifficulty = 1
        newExercise3.idExercise = 3
        newExercise3.listIdSteps = [9,10,11,12]
        newExercise3.namaExercise = "In and out squat jumps"
        newExercise3.videoUrl = "https://www.youtube.com/embed/FAgNMPeA6Pw?playsinline=1"
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
        
        let warning3 = Warning(context: self.context)
        warning3.idWarning = 3
        warning3.warningText = "Do not let your knees cave inward when jumping from the wider stance."
        
        newExercise3.steps = NSSet.init(array: [step9, step10, step11, step12])
        newExercise3.warning = NSSet.init(array: [warning3])
        
        //4
        let newExercise4 = Exercise(context: self.context)
        newExercise4.idDifficulty = 1
        newExercise4.idExercise = 4
        newExercise4.listIdSteps = [1,13,14,15,8]
        newExercise4.namaExercise = "Side step squat"
        newExercise4.videoUrl = "https://www.youtube.com/embed/VHnHsB8Cyhs?playsinline=1"
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
        
        let warning4 = Warning(context: self.context)
        warning4.idWarning = 4
        warning4.warningText = "Perform an equal number of reps stepping to the right and left."
        
        newExercise4.steps = NSSet.init(array: [step13, step14, step15])
        newExercise4.warning = NSSet.init(array: [warning4])
        
        //5
        let newExercise5 = Exercise(context: self.context)
        newExercise5.idDifficulty = 1
        newExercise5.idExercise = 5
        newExercise5.listIdSteps = [16,17,18,19]
        newExercise5.namaExercise = "Lateral lunge"
        newExercise5.videoUrl = "https://www.youtube.com/embed/Vd8lrUvoujE?playsinline=1"
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
        
        let warning5 = Warning(context: self.context)
        warning5.idWarning = 5
        warning5.warningText = "Make sure to keep the heels of both feet on the floor as you lower."
        
        newExercise5.steps = NSSet.init(array: [step16, step17, step18, step19])
        newExercise5.warning = NSSet.init(array: [warning5])
        
        //6
        let newExercise6 = Exercise(context: self.context)
        newExercise6.idDifficulty = 1
        newExercise6.idExercise = 6
        newExercise6.listIdSteps = [20,21,19]
        newExercise6.namaExercise = "Kneeling squat"
        newExercise6.videoUrl = "https://www.youtube.com/embed/Si5X-u_v05U?playsinline=1"
        newExercise6.warningData = [6]
        
        let step20 = ExerciseSteps(context: self.context)
        step20.idStep = 20
        step20.steps = "Start by kneeling on your knee, make sure your knee opened as your shoulder width apart and your back is straight"
        
        let step21 = ExerciseSteps(context: self.context)
        step21.idStep = 21
        step21.steps = "Slowly lower down your body until it touch your feet"
        
        let warning6 = Warning(context: self.context)
        warning6.idWarning = 6
        warning6.warningText = "Keep your body straight while kneeling."
        
        newExercise6.steps = NSSet.init(array: [step20, step21])
        newExercise6.warning = NSSet.init(array: [warning6])
        
        //7
        let newExercise7 = Exercise(context: self.context)
        newExercise7.idDifficulty = 1
        newExercise7.idExercise = 7
        newExercise7.listIdSteps = [22,23,24,25,26]
        newExercise7.namaExercise = "Jumping jack"
        newExercise7.videoUrl = "https://www.youtube.com/embed/oNJIIxWaW2M?playsinline=1"
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
        
        let warning7 = Warning(context: self.context)
        warning7.idWarning = 7
        warning7.warningText = "While doing, you have to inhale in the starting position and exhale while spreading your legs."
    
        newExercise7.steps = NSSet.init(array: [step22, step23, step24, step25, step26])
        newExercise7.warning = NSSet.init(array: [warning7])
        
        //8
        let newExercise8 = Exercise(context: self.context)
        newExercise8.idDifficulty = 1
        newExercise8.idExercise = 8
        newExercise8.listIdSteps = [27,28,29,30]
        newExercise8.namaExercise = "Mountain climbers"
        newExercise8.videoUrl = "https://www.youtube.com/embed/hML7yNgS5JU?playsinline=1"
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
        
        let warning8 = Warning(context: self.context)
        warning8.idWarning = 8
        warning8.warningText = "When you're focused on the move, you might find yourself holding your breath. Remember to breathe."
        
        newExercise8.steps = NSSet.init(array: [step27, step28, step29, step30])
        newExercise8.warning = NSSet.init(array: [warning8])
        
        //9
        let newExercise9 = Exercise(context: self.context)
        newExercise9.idDifficulty = 1
        newExercise9.idExercise = 9
        newExercise9.listIdSteps = [31,32,33,8]
        newExercise9.namaExercise = "Side to side plié"
        newExercise9.videoUrl = "https://www.youtube.com/embed/QfS2x4VOZuE?playsinline=1"
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
        
        let warning9 = Warning(context: self.context)
        warning9.idWarning = 9
        warning9.warningText = "The whole time your core is tight, your back is flat and shoulders are back."
        
        newExercise9.steps = NSSet.init(array: [step31, step32, step33])
        newExercise9.warning = NSSet.init(array: [warning9])
        
        //10
        let newExercise10 = Exercise(context: self.context)
        newExercise10.idDifficulty = 1
        newExercise10.idExercise = 10
        newExercise10.listIdSteps = [34,35,36]
        newExercise10.namaExercise = "Glute bridge"
        newExercise10.videoUrl = "https://www.youtube.com/embed/q0wiGivpVQc?playsinline=1"
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
        
        let warning10 = Warning(context: self.context)
        warning10.idWarning = 10
        warning10.warningText = "Squeeze those glutes hard and keep your abs drawn in so you don’t overextend your back during the exercise."
        
        newExercise10.steps = NSSet.init(array: [step34, step35, step36])
        newExercise10.warning = NSSet.init(array: [warning10])
        
        //11
        let newExercise11 = Exercise(context: self.context)
        newExercise11.idDifficulty = 2
        newExercise11.idExercise = 11
        newExercise11.listIdSteps = [37,38,39,40,8]
        newExercise11.namaExercise = "Single leg hip raises"
        newExercise11.videoUrl = "https://www.youtube.com/embed/OTRmchnEkV0?playsinline=1"
        newExercise11.warningData = [11]
        
        
        let step37 = ExerciseSteps(context: self.context)
        step37.idStep = 37
        step37.steps = "Lie on your back with your right knee bent and right foot flat on the floor."
        
        let step38 = ExerciseSteps(context: self.context)
        step38.idStep = 38
        step38.steps = "Raise your left leg so it’s in line with your right thigh."
        
        let step39 = ExerciseSteps(context: self.context)
        step39.idStep = 39
        step39.steps = "Push your hips up, keeping your left leg elevated."
        
        let step40 = ExerciseSteps(context: self.context)
        step40.idStep = 40
        step40.steps = "Pause and slowly return to the starting position"
        
        let warning11 = Warning(context: self.context)
        warning11.idWarning = 11
        warning11.warningText = "Keep your foot underneath your knee throughout the exercise. Avoid having it too far in front of you."
        
        newExercise11.steps = NSSet.init(array: [step37, step38, step39, step40])
        newExercise11.warning = NSSet.init(array: [warning11])
        
        
        //12
        let newExercise12 = Exercise(context: self.context)
        newExercise12.idDifficulty = 2
        newExercise12.idExercise = 12
        newExercise12.listIdSteps = [41,42,43,44,8]
        newExercise12.namaExercise = "Side leg raises"
        newExercise12.videoUrl = "https://www.youtube.com/embed/gYpwEr0cLO8?playsinline=1"
        newExercise12.warningData = [12]
        
        
        let step41 = ExerciseSteps(context: self.context)
        step41.idStep = 41
        step41.steps = "Lie down on a mat or floor, your body should be in a straight line with your leg extended and feet stacked at top of each other"
        
        let step42 = ExerciseSteps(context: self.context)
        step42.idStep = 42
        step42.steps = "Place your arm straight on the floor under your head or bend your elbow and cradle your head for support. Place your left hand out front for extra support or let it rest on your leg or hip."
        
        let step43 = ExerciseSteps(context: self.context)
        step43.idStep = 43
        step43.steps = "s you exhale, gently raise your left leg off the lower leg. Stop raising your leg when you feel the muscles flex in your lower back or obliques."
        
        let step44 = ExerciseSteps(context: self.context)
        step44.idStep = 44
        step44.steps = "Inhale and lower the leg back down to meet the right leg. Stack your feet again."
        
        let warning12 = Warning(context: self.context)
        warning12.idWarning = 12
        warning12.warningText = "Avoid raising your leg too high throughout the exercise. Lower it when you start to feel pressure in the lower back or obliques."
        
        newExercise12.steps = NSSet.init(array: [step41, step42, step43, step44])
        newExercise12.warning = NSSet.init(array: [warning12])
        
        //13
        let newExercise13 = Exercise(context: self.context)
        newExercise13.idDifficulty = 2
        newExercise13.idExercise = 13
        newExercise13.listIdSteps = [45,46,26]
        newExercise13.namaExercise = "Pulse squat"
        newExercise13.videoUrl = "https://www.youtube.com/embed/0ry2D5wVYLQ?playsinline=1"
        newExercise13.warningData = [13]
        
        
        let step45 = ExerciseSteps(context: self.context)
        step45.idStep = 45
        step45.steps = "Start standing with your feet hip-width apart and arms stretched out in front"
        
        let step46 = ExerciseSteps(context: self.context)
        step46.idStep = 46
        step46.steps = "Perform a squat and hold it at the bottoms as you pulse a few inches up and down"
        
        let warning13 = Warning(context: self.context)
        warning13.idWarning = 13
        warning13.warningText = "While in the bottom of a squat and doing pulses, you want to keep your form the entire time."
        
        newExercise13.steps = NSSet.init(array: [step45, step46])
        newExercise13.warning = NSSet.init(array: [warning13])
        
        //14
        let newExercise14 = Exercise(context: self.context)
        newExercise14.idDifficulty = 2
        newExercise14.idExercise = 14
        newExercise14.listIdSteps = [47,48,49,26]
        newExercise14.namaExercise = "Plié squat calf raise"
        newExercise14.videoUrl = "https://www.youtube.com/embed/gvRi_uBWXIU?playsinline=1"
        newExercise14.warningData = [14]
        
        
        let step47 = ExerciseSteps(context: self.context)
        step47.idStep = 47
        step47.steps = "Stand with your feet wide, toes slightly pointed out"
        
        let step48 = ExerciseSteps(context: self.context)
        step48.idStep = 48
        step48.steps = "Raise your heels off the floor and squeeze your calves."
        
        let step49 = ExerciseSteps(context: self.context)
        step49.idStep = 49
        step49.steps = "Lower your heels and return to the starting position."
        
        let warning14 = Warning(context: self.context)
        warning14.idWarning = 14
        warning14.warningText = "Breathe out as you raise your heels and squeeze your calves then slowly lower your feet to the starting position."
        
        newExercise14.steps = NSSet.init(array: [step47, step48, step49])
        newExercise14.warning = NSSet.init(array: [warning14])
        
        //15
        let newExercise15 = Exercise(context: self.context)
        newExercise15.idDifficulty = 2
        newExercise15.idExercise = 15
        newExercise15.listIdSteps = [34,50,51,26]
        newExercise15.namaExercise = "Glute bridge calf raise"
        newExercise15.videoUrl = "https://www.youtube.com/embed/6w7Dgt1Jeec?playsinline=1"
        newExercise15.warningData = [15]
        
        
        let step50 = ExerciseSteps(context: self.context)
        step50.idStep = 50
        step50.steps = "Then slowly lift of your heel and hold it for couple of seconds"
        
        let step51 = ExerciseSteps(context: self.context)
        step51.idStep = 51
        step51.steps = "Slowly lowering down your heel again"
        
        let warning15 = Warning(context: self.context)
        warning15.idWarning = 15
        warning15.warningText = "Make sure when you come back down, you get your core is into the spine so your back is nice and flat."
        
        newExercise15.steps = NSSet.init(array: [step50, step51])
        newExercise15.warning = NSSet.init(array: [warning15])
        
        //16
        let newExercise16 = Exercise(context: self.context)
        newExercise16.idDifficulty = 2
        newExercise16.idExercise = 16
        newExercise16.listIdSteps = [4,5,52,53,19]
        newExercise16.namaExercise = "Split squat"
        newExercise16.videoUrl = "https://www.youtube.com/embed/is8GZ7Lspuc?playsinline=1"
        newExercise16.warningData = [16]
        
        
        let step52 = ExerciseSteps(context: self.context)
        step52.idStep = 52
        step52.steps = "Make sure the heel of your other leg is raised"
        
        let step53 = ExerciseSteps(context: self.context)
        step53.idStep = 53
        step53.steps = "Keep your torso straight, lower slowly until your back knee almost touched the floor"
        
        let warning16 = Warning(context: self.context)
        warning16.idWarning = 16
        warning16.warningText = "Make sure you have straight line between the hip, the knee and the ankle."
        
        newExercise16.steps = NSSet.init(array: [step52, step53])
        newExercise16.warning = NSSet.init(array: [warning16])
        
        //17
        let newExercise17 = Exercise(context: self.context)
        newExercise17.idDifficulty = 2
        newExercise17.idExercise = 17
        newExercise17.listIdSteps = [16,54,55,56,8]
        newExercise17.namaExercise = "Walking lunge"
        newExercise17.videoUrl = "https://www.youtube.com/embed/czzWZhOD12c?playsinline=1"
        newExercise17.warningData = [17]
        
        
        let step54 = ExerciseSteps(context: self.context)
        step54.idStep = 54
        step54.steps = "Step forward with your right leg, bend the right knee, lowering down so it's parallel to the floor in lunge position"
        
        let step55 = ExerciseSteps(context: self.context)
        step55.idStep = 55
        step55.steps = "Pause for a beat"
        
        let step56 = ExerciseSteps(context: self.context)
        step56.idStep = 56
        step56.steps = "Without moving your right leg, move your left leg forward"
        
        let warning17 = Warning(context: self.context)
        warning17.idWarning = 17
        warning17.warningText = "Keep your body upright through the movement. Try to avoid leaning forward too much."
        
        newExercise17.steps = NSSet.init(array: [step54, step55, step56])
        newExercise17.warning = NSSet.init(array: [warning17])
        
        //18
        let newExercise18 = Exercise(context: self.context)
        newExercise18.idDifficulty = 2
        newExercise18.idExercise = 18
        newExercise18.listIdSteps = [57,58,59,60,8]
        newExercise18.namaExercise = "Reverse lunge"
        newExercise18.videoUrl = "https://www.youtube.com/embed/BeW7XYwPzkY?playsinline=1"
        newExercise18.warningData = [18]
        
        
        let step57 = ExerciseSteps(context: self.context)
        step57.idStep = 57
        step57.steps = "Stand upright with your hands at your hips"
        
        let step58 = ExerciseSteps(context: self.context)
        step58.idStep = 58
        step58.steps = "Take a large step back with your left foot"
        
        let step59 = ExerciseSteps(context: self.context)
        step59.idStep = 59
        step59.steps = "Lower your hips so that your right thigh becomes parallel with your right knee positioned directly to your ankle"
        
        let step60 = ExerciseSteps(context: self.context)
        step60.idStep = 60
        step60.steps = "Return to standing by pressing your right heel into the floor"
        
        let warning18 = Warning(context: self.context)
        warning18.idWarning = 18
        warning18.warningText = "Make sure you keep your torso upright throughout the movement."
        
        newExercise18.steps = NSSet.init(array: [step57, step58, step59, step60])
        newExercise18.warning = NSSet.init(array: [warning18])
        
        //19
        let newExercise19 = Exercise(context: self.context)
        newExercise19.idDifficulty = 2
        newExercise19.idExercise = 19
        newExercise19.listIdSteps = [61,62,63,64,65,26]
        newExercise19.namaExercise = "Inchworm"
        newExercise19.videoUrl = " https://www.youtube.com/embed/nqwl8qnSpPA?playsinline=1"
        newExercise19.warningData = [19]
        
        
        let step61 = ExerciseSteps(context: self.context)
        step61.idStep = 61
        step61.steps = "Begin standing in your back edge of the mat"
        
        let step62 = ExerciseSteps(context: self.context)
        step62.idStep = 62
        step62.steps = "Hinge your body forward and walk your hands out in front of you along the floor, keeping your feet in place"
        
        let step63 = ExerciseSteps(context: self.context)
        step63.idStep = 63
        step63.steps = "Continue walking your arms out past the plank position."
        
        let step64 = ExerciseSteps(context: self.context)
        step64.idStep = 64
        step64.steps = "Start walking your feet towards your hands in small steps"
        
        let step65 = ExerciseSteps(context: self.context)
        step65.idStep = 65
        step65.steps = "Continue inching your body up until your feet meet your palms"
        
        let warning19 = Warning(context: self.context)
        warning19.idWarning = 19
        warning19.warningText = "Breathe deeply and lift the heels as you walk out, keeping the toes in the same spot."
        
        newExercise19.steps = NSSet.init(array: [step61, step62, step63, step64, step65])
        newExercise19.warning = NSSet.init(array: [warning19])
        
        //20
        let newExercise20 = Exercise(context: self.context)
        newExercise20.idDifficulty = 2
        newExercise20.idExercise = 20
        newExercise20.listIdSteps = [66,67,68,69,8]
        newExercise20.namaExercise = "Donkey kicks"
        newExercise20.videoUrl = "https://www.youtube.com/embed/0tId0Sia_CQ?playsinline=1"
        newExercise20.warningData = [20]
        
        
        let step66 = ExerciseSteps(context: self.context)
        step66.idStep = 66
        step66.steps = "Start by knees hip-width apart, hands under your shoulders, neck and spine neutral"
        
        let step67 = ExerciseSteps(context: self.context)
        step67.idStep = 67
        step67.steps = "Begin to lift your right leg, knee staying bent, foot staying flat and hinging at the hip"
        
        let step68 = ExerciseSteps(context: self.context)
        step68.idStep = 68
        step68.steps = "Use your glute to press your foot directly toward the ceiling and squeeze at the top. Ensure your pelvis and working hip stay pointed toward to the ground"
        
        let step69 = ExerciseSteps(context: self.context)
        step69.idStep = 69
        step69.steps = "Return to the starting position"
        
        let warning20 = Warning(context: self.context)
        warning20.idWarning = 20
        warning20.warningText = "Don't let your lower back arch as your leg lifts."
        
        newExercise20.steps = NSSet.init(array: [step66, step67, step68, step69])
        newExercise20.warning = NSSet.init(array: [warning20])
        
    }
}
