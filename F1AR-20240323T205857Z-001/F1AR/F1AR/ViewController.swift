//
//  ViewController.swift
//  F1AR
//
//  Created by Adwaith Kumar on 3/23/24.
//

import UIKit
import SceneKit
import ARKit

import Foundation

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create all car objects
        var allCars = createCars()
        
        // Fill car objects with data
        getCSVData(allCars)
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        let trackScene = SCNScene(named: "track.dae")
        
        guard let trackNode = trackScene?.rootNode.childNode(withName: "trackModel", recursively: true) else{
            fatalError("Track Model Not Found!")
        }
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.989) // Dark gray color

        // Apply the material to the trackNode
        trackNode.geometry?.materials = [material]
        
        // Assign all cars to scene
        var index = 0;
        while index < allCars.count{
            scene.rootNode.addChildNode(allCars[index].node)
            index = index + 1
        }
        
        //Determines positioning of track
        trackNode.position = SCNVector3(0, 0, -1)
        scene.rootNode.addChildNode(trackNode)
        // Set the scene to the view
        sceneView.scene = scene
        
        // Creating and positioning the board
        let geometryBoard = SCNPlane(width: 0.15, height: 0.6)
        let materialBoard = SCNMaterial()
        materialBoard.diffuse.contents = UIImage(named: "lineup")
        geometryBoard.materials = [materialBoard]
        let nodeBoard = SCNNode(geometry: geometryBoard)
        nodeBoard.eulerAngles = SCNVector3(0, 0.5, 0)
        nodeBoard.position = SCNVector3(-0.46, 0.3, -1)
        scene.rootNode.addChildNode(nodeBoard)
        
        
        arraySize = data63.count;
        //Ensure that all of these are the same to make sure all cars are filled with data
        print(arraySize)
        print(data77.count)
        print(data04.count)
        
        // Starts the race animation
        race(0, allCars)
        
    }
    
    // Create array of car objects
    func createCars() -> [car]{
        
        let geometry01 = SCNSphere(radius: 0.007)
        let material01 = SCNMaterial();
        material01.diffuse.contents = UIColor(red: 254.0 / 255.0, green: 213.0 / 255.0, blue: 2.0 / 255.0, alpha: 1);
        geometry01.materials = [material01]
        var d01 = SCNNode(geometry: geometry01)
        d01.position = SCNVector3(0, 0, -1)
        var car01 = car(carNum: 01, node: d01, filePath: "driver_01_data.txt", data: data01)
        
        let geometry63 = SCNSphere(radius: 0.007)
        let material63 = SCNMaterial();
        material63.diffuse.contents = UIColor(red: 200.0 / 255.0, green: 204.0 / 255.0, blue: 206.0 / 255.0, alpha: 1);
        geometry63.materials = [material63]
        var d63 = SCNNode(geometry: geometry63)
        d63.position = SCNVector3(0, 0, -1)
        var car63 = car(carNum: 63, node: d63, filePath: "driver_63_data.txt", data: data63)
        
        let geometry55 = SCNSphere(radius: 0.007)
        let material55 = SCNMaterial();
        material55.diffuse.contents = UIColor(red: 236.0/255.0, green: 7.0/255.0, blue: 66.0/255.0, alpha: 1);
        geometry55.materials = [material55]
        var d55 = SCNNode(geometry: geometry55)
        d55.position = SCNVector3(0, 0, -1)
        var car55 = car(carNum: 55, node: d55, filePath: "driver_55_data.txt", data: data55)
        
        let geometry14 = SCNSphere(radius: 0.007)
        let material14 = SCNMaterial();
        material14.diffuse.contents = UIColor(red: 3.0/255.0, green: 122.0/255.0, blue: 104.0/255.0, alpha: 1);
        geometry14.materials = [material14]
        var d14 = SCNNode(geometry: geometry14)
        d14.position = SCNVector3(0, 0, -1)
        var car14 = car(carNum: 14, node: d14, filePath: "driver_14_data.txt", data: data14)
        
        let geometry23 = SCNSphere(radius: 0.007)
        let material23 = SCNMaterial();
        material23.diffuse.contents = UIColor(red: 0.0, green: 160.0/255.0, blue: 222.0/255.0, alpha: 1);
        geometry23.materials = [material23]
        var d23 = SCNNode(geometry: geometry23)
        d23.position = SCNVector3(0, 0, -1)
        var car23 = car(carNum: 23, node: d23, filePath: "driver_23_data.txt", data: data23)
        
        let geometry10 = SCNSphere(radius: 0.007)
        let material10 = SCNMaterial();
        material10.diffuse.contents = UIColor(red: 236.0/255.0, green: 3.0/255.0, blue: 116.0/255.0, alpha: 1);
        geometry10.materials = [material10]
        var d10 = SCNNode(geometry: geometry10)
        d10.position = SCNVector3(0, 0, -1)
        var car10 = car(carNum: 10, node: d10, filePath: "driver_10_data.txt", data: data10)
        
        let geometry22 = SCNSphere(radius: 0.007)
        let material22 = SCNMaterial();
        material22.diffuse.contents = UIColor(red: 32.0/255.0, green: 57.0/255.0, blue: 76.0/255.0, alpha: 1);
        geometry22.materials = [material22]
        var d22 = SCNNode(geometry: geometry22)
        d22.position = SCNVector3(0, 0, -1)
        var car22 = car(carNum: 22, node: d22, filePath: "driver_22_data.txt", data: data22)
        
        let geometry04 = SCNSphere(radius: 0.007)
        let material04 = SCNMaterial();
        material04.diffuse.contents = UIColor(red: 255.0/255.0, green: 128.0/25.0, blue: 0.0/255.0, alpha: 1);
        geometry04.materials = [material04]
        var d04 = SCNNode(geometry: geometry04)
        d04.position = SCNVector3(0, 0, -1)
        var car04 = car(carNum: 04, node: d04, filePath: "driver_04_data.txt", data: data04)
        
        let geometry77 = SCNSphere(radius: 0.007)
        let material77 = SCNMaterial();
        material77.diffuse.contents = UIColor(red: 164.0/255.0, green: 33.0/255.0, blue: 52.0/255.0, alpha: 1);
        geometry77.materials = [material77]
        var d77 = SCNNode(geometry: geometry77)
        d77.position = SCNVector3(0, 0, -1)
        var car77 = car(carNum: 77, node: d77, filePath: "driver_77_data.txt", data: data77)
        
        let geometry20 = SCNSphere(radius: 0.007)
        let material20 = SCNMaterial();
        material20.diffuse.contents = UIColor(red: 230.0/255.0, green: 0.0/255.0, blue: 43.0/255.0, alpha: 1);
        geometry20.materials = [material20]
        var d20 = SCNNode(geometry: geometry20)
        d20.position = SCNVector3(0, 0, -1)
        var car20 = car(carNum: 20, node: d20, filePath: "driver_20_data.txt", data: data20)
        
        return [car01, car63, car55, car14, car23, car10, car22, car04, car77, car20];
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    struct car{
        var carNum: Int; //Always 2 digit
        var node: SCNNode;
        var filePath: String;
        var data: [entry]; //make sure this is just a pointer * _
    }
    
    struct entry {
        var x: Float;
        var y: Float;
        var z: Float;
    }
    
    var dataTime: [Int] = []
    
    var data01: [entry] = [];
    var data63: [entry] = [];
    var data55: [entry] = [];
    var data14: [entry] = [];
    var data23: [entry] = [];
    var data10: [entry] = [];
    var data22: [entry] = [];
    var data04: [entry] = [];
    var data77: [entry] = [];
    var data20: [entry] = [];
    
    var arraySize = 0;
    
    func getCSVData(_ allCars: [car]) {
        //Loop through all the cars
        var len = allCars.count
        var index = 0
        while(index < len){
            var pecan = allCars[index]
            let filePath = pecan.filePath
            
            // Pull data from the correct file based on "path" field of car struct
            let fileManager = FileManager.default
            let path = Bundle.main.resourcePath!
            do {
                let items = try fileManager.contentsOfDirectory(atPath: path)
                
                //This works so don't mess w it!!
                for item in items {
                    print("Found \(item)")
                    if(item == filePath){
                        do {
                            let p = path + "/" + filePath
                            let content = try String(contentsOfFile: p, encoding: .utf8)
                            print("no error")
                            let rows = content.components(separatedBy: "\n")
                            var count = 0;
                            var prev = 1080294;
                            // Iterate over each row
                            for row in rows {
                                if(count == rows.count - 1){
                                    break
                                }
                                // Split the row by comma to get an array of values
                                let values = row.components(separatedBy: ",")
                                
                                // Process each value
                                
            
                                var temp = entry(x: 0, y: 0, z: 0)
                                if let f1 = Float(values[1]) {
                                    if let n = Int(values[0]){
                                        dataTime.append(n - prev);
                                        prev = n
                                        temp.x = f1 * 0.0000429815 // Scales down from the size of the real track
                                    }
                                    
                                } else {
                                    print("Invalid float string")
                                    print(values[1])
                                }
                                if let f2 = Float(values[2]) {
                                    temp.y = f2 * 0.0000429815// Scales down from the size of the real track
                                } else {
                                    print("Invalid float string")
                                    print(values[2])
                                }
                                let substring = values[3].prefix(2)
                                
                                // Convert the substring to an integer
                                if let intValue = Int(substring) {
                                    temp.z = Float(intValue) * 0.0000429815
                                } else {
                                    print("Invalid integer string")
                                    print(values[3])
                                }
                                let carNum = allCars[index].carNum
                                if(carNum == 01){
                                    data01.append(temp)
                                }
                                else if(carNum == 63){
                                    data63.append(temp)
                                }
                                else if(carNum == 55){
                                    data55.append(temp)
                                }
                                else if(carNum == 14){
                                    data14.append(temp)
                                }
                                else if(carNum == 23){
                                    data23.append(temp)
                                }
                                else if(carNum == 10){
                                    data10.append(temp)
                                }
                                else if(carNum == 22){
                                    data22.append(temp)
                                }
                                else if(carNum == 04){
                                    data04.append(temp)
                                }
                                else if(carNum == 77){
                                    data77.append(temp)
                                }
                                else if(carNum == 20){
                                data20.append(temp)
                                }
                                count = count + 1;
                            }
                        } catch {
                            print("Error reading file: \(error)")
                        }
                    }
                }
                
            }
            catch {
            }
            index = index + 1
        }
    }

    
    func testRace(_ node: SCNNode) {
        var count = 2;
        for entry in data63 {
            print("on new entry")
            node.position = SCNVector3(entry.z , entry.x, entry.y)
            print(entry)
            
            count = count - 1;
            if(count == 0){
                break;
            }
        }
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    func update63(_ index: Int, _ node: SCNNode){
        node.position = SCNVector3(data63[index].x + 0.05, data63[index].z, data63[index].y - 1.2)
    }
    
    //Main function for animation
    //Loops recursively until we reach the end of data
    func race(_ count: Int, _ allCars: [car]){//, _ node77: SCNNode, _ node4: SCNNode){
        print("we're racing")
        print(count)
        if(count == arraySize){
            return
        }
        let len = allCars.count
        var driverID = 0
        while(driverID < len){
            var tempData = entry(x: 0, y: 0, z: 0)
            var carNum = allCars[driverID].carNum
            if(carNum == 01){
                tempData = data01[count]
            }
            else if(carNum == 63){
                tempData = data63[count]
            }
            else if(carNum == 55){
                tempData = data55[count]
            }
            else if(carNum == 14){
                tempData = data14[count]
            }
            else if(carNum == 23){
                tempData = data23[count]
            }
            else if(carNum == 10){
                tempData = data10[count]
            }
            else if(carNum == 22){
                tempData = data22[count]
            }
            else if(carNum == 04){
                tempData = data04[count]
            }
            else if(carNum == 77){
                tempData = data77[count]
            }
            else if(carNum == 20){
                tempData = data20[count]
            }
            allCars[driverID].node.position = SCNVector3(tempData.x + 0.05, tempData.z, tempData.y - 1.2)
            driverID = driverID + 1
        }
        let delayTime = Double(dataTime[Int(count)]) / 2000.0
        //let delayTime = Double(dataTime[Int(count)]) / 1000.0
        //print(delayTime)
        DispatchQueue.main.asyncAfter(deadline: .now() + delayTime) {
            self.race(count + 1, allCars)
        }
    }
    
    
}


