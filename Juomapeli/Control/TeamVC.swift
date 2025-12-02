//
//  TeamVC.swift
//  Juomapeli
//
//  Created by Veikko Arvonen on 2.12.2025.
//

import UIKit

class TeamView: UIViewController {
    
    var hasSetUI: Bool = false
    let UIBuilder = TeamVCUI()
    var UIElements: TeamUIElements!
    var gameConfiguaration: TeamModeConfiguration!
    var gameParameters: TeamModeParameters?
    let languageManager = LanguageManager()
    let gameFunctionality = GameFunctionality()
    
    enum GamePhase {
        case settingTeams
        case instructions
        case playing
        case ended
    }
    
    var gamePhase: GamePhase = .settingTeams
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if C.debugApp { checkGameConfiguration() }
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetUI {
            hasSetUI = true
            setUI()
            updateUI(phase: gamePhase)
            setGameParameters()
        }
    }
    
//MARK: - Objc functions
    
    @objc private func handleRandomizeTap() {
        print("Randomize tapped")
        if gamePhase == .settingTeams {
            randomizeTeams()
        }
    }

    @objc private func handleStartGameTap() {
        print("Start Game tapped")
        if gamePhase == .settingTeams {
            if canProceedToGame() {
                proceedToGame()
            } else {
                showAlert()
            }
        }
    }

    @objc private func handleScreenTap() {
        print("Screen tapped")
        // Your logic here
    }
    
    @objc private func handleRedTap() {
        print("Red tapped")
        // Your logic here
    }
    
    @objc private func handleBlueTap() {
        print("Blue tapped")
        // Your logic here
    }
    
//MARK: - Team selection pan gesture
    
    @objc private func handlePlayerPan(_ gesture: UIPanGestureRecognizer) {
        guard let label = gesture.view as? UILabel else { return }
        
        // This is your "ID" (same as index in gameConfiguaration.players)
        let id = label.tag
        let translation = gesture.translation(in: view)
        let velocity = gesture.velocity(in: view)
        
        switch gesture.state {
        case .changed:
            // move the label with the finger
            label.center.x = CGFloat(label.center.x + translation.x,)
            gesture.setTranslation(.zero, in: view)
            
        case .ended, .cancelled:
            let vX = velocity.x

                if vX < -1000 {
                    // move to blue team
                    let targetX = view.frame.width * 0.25
                    moveTeamMember(index: id, toRed: true)
                    UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut]) {
                        label.center.x = targetX
                    }
                } else if vX > 1000 {
                    // Move to blue team
                    let targetX = view.frame.width * 0.75
                    moveTeamMember(index: id, toRed: false)
                    UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut]) {
                        label.center.x = targetX
                    }
                } else {
                    //Move to 25% or 75% based on whether the label center x is on left or right side of the view
                    let midpoint = view.frame.width / 2
                        let targetX: CGFloat
                        
                        if label.center.x < midpoint {
                            // Left half → red team
                            moveTeamMember(index: id, toRed: true)
                            targetX = view.frame.width * 0.25
                        } else {
                            // Right half → blue team
                            moveTeamMember(index: id, toRed: false)
                            targetX = view.frame.width * 0.75
                        }
                        
                        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
                            label.center.x = targetX
                        }
                }
            
        default:
            break
        }
    }

    
//MARK: - Team selection phase

    private func setGameParameters() {
        gameParameters?.currentTask = 0
        gameParameters?.numberOfTasks = gameConfiguaration.shorterRound ? 10 : 20
        gameParameters?.taskTemplates = []
        randomizeTeams()
    }
    
    private func randomizeTeams() {
        var teamIndexArray: [Int] = []
        var addToRed: Bool = true
        for _ in 0..<gameConfiguaration.players.count {
            let index = addToRed ? 0 : 1
            addToRed.toggle()
            teamIndexArray.append(index)
        }
        
        teamIndexArray.shuffle()
        gameConfiguaration.teamConfigurationIndexes = teamIndexArray
        
        if C.debugApp { print("Players: \(gameConfiguaration.players)") }
        if C.debugApp { print("Team index array: \(teamIndexArray)") }
        
        view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut]) { [self] in
            for i in 0..<UIElements.playerLabels.count {
                if teamIndexArray[i] == 0 {
                    UIElements.playerLabels[i].center.x = view.frame.width * 1 / 4
                } else {
                    UIElements.playerLabels[i].center.x = view.frame.width * 3 / 4
                }
            }
        } completion: { _ in
            self.view.isUserInteractionEnabled = true
        }
    }
    
    private func moveTeamMember(index: Int, toRed: Bool) {
        let indexToMove: Int = toRed ? 0 : 1
        gameConfiguaration.teamConfigurationIndexes[index] = indexToMove
        if C.debugApp { print("Players: \(gameConfiguaration.players)") }
        if C.debugApp { print("Team index array: \(gameConfiguaration.teamConfigurationIndexes)") }
    }
    
    private func canProceedToGame() -> Bool {
        let redTeamCount = gameConfiguaration.teamConfigurationIndexes.filter { $0 == 0 }.count
        let blueTeamCount = gameConfiguaration.teamConfigurationIndexes.filter { $0 == 1 }.count
        
        let difference = redTeamCount - blueTeamCount
        
        if abs(difference) > 1 {
            if C.debugApp { print("Cannot proceed, unequal teams! (R:\(redTeamCount) B:\(blueTeamCount))") }
            return false
        }
        
        return true
    }

    private func showAlert() {
        let alert = UIAlertController(
            title: languageManager.localizedString(forKey: "TEAM_ERROR_HEADER"),
            message: languageManager.localizedString(forKey: "TEAM_ERROR_MESSAGE"),
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }

    private func proceedToGame() {
        gamePhase = gameConfiguaration.countPoints ? .instructions : .playing
        if C.debugApp { print("Proceeding to game!, current phase: \(gamePhase)") }
        updateUI(phase: gamePhase)
    }
    
//MARK: - Playing phase
    
    private func setTeamParameters() {
        
    }
    
}

//MARK: - User interface

extension TeamView {
    
    private func setUI() {
        
        view.backgroundColor = UIColor(named: "teamMode")
        
        //backGroundImage
        let bgImage = UIBuilder.generateBackGroundImage(viewFrame: view.frame, safeArea: view.safeAreaInsets, countPoints: gameConfiguaration.countPoints)
        view.addSubview(bgImage)
        
        //Task label
        let tLabel = UIBuilder.generateTaskLabel(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        view.addSubview(tLabel)
        if gameConfiguaration.countPoints { tLabel.center.y -= 100 }
        
        //Point instruction button
        let iView = UIBuilder.generatePointInstructionView(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        view.addSubview(iView)
        
        //Red team view
        let rView = UIBuilder.generateRedTeamView(viewFrame: view.frame)
        view.addSubview(rView)
        
        //Blue team view
        let bView = UIBuilder.generateBlueTeamView(viewFrame: view.frame)
        view.addSubview(bView)
        
        //Red team button
        let rtButton = UIBuilder.generateRedTeamButton(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        rtButton.container.isUserInteractionEnabled = true
        let redTap = UITapGestureRecognizer(target: self, action: #selector(handleRedTap))
        rtButton.container.addGestureRecognizer(redTap)
        view.addSubview(rtButton.container)
        
        //Blue team button
        let btButton = UIBuilder.generateBlueTeamButton(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        btButton.container.isUserInteractionEnabled = true
        let blueTap = UITapGestureRecognizer(target: self, action: #selector(handleBlueTap))
        btButton.container.addGestureRecognizer(blueTap)
        view.addSubview(btButton.container)
        
        // Randomize button
        let rButton = UIBuilder.generateRandomizeButton(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        rButton.isUserInteractionEnabled = true
        let rTap = UITapGestureRecognizer(target: self, action: #selector(handleRandomizeTap))
        rButton.addGestureRecognizer(rTap)
        view.addSubview(rButton)

        // Start game button
        let tButton = UIBuilder.generateStartGameButton(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        tButton.isUserInteractionEnabled = true
        let tTap = UITapGestureRecognizer(target: self, action: #selector(handleStartGameTap))
        tButton.addGestureRecognizer(tTap)
        view.addSubview(tButton)

        //Red team header
        let rHeader = UIBuilder.generateRedTeamHeaderView(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        view.addSubview(rHeader)
        
        //Blue team header
        let bHeader = UIBuilder.generateBlueTeamHeaderView(viewFrame: view.frame, safeArea: view.safeAreaInsets)
        view.addSubview(bHeader)
        
        let screenTap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap))
        view.addGestureRecognizer(screenTap)

        var playerLabels: [UILabel] = []
        
        for i in 0..<gameConfiguaration.players.count {
            let playerLabel = UIBuilder.generatePlayerLabel(viewFrame: view.frame, player: gameConfiguaration.players[i])
            playerLabel.tag = i
            playerLabel.isUserInteractionEnabled = true
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePlayerPan(_:)))
            playerLabel.addGestureRecognizer(pan)
            view.addSubview(playerLabel)
            playerLabels.append(playerLabel)
        }
        
        UIElements = TeamUIElements(backGroundImage: bgImage, taskLabel: tLabel, redTeamButton: rtButton, blueTeamVButton: btButton, instructionView: iView, redView: rView, blueView: bView, redHeader: rHeader, blueHeader: bHeader, randomizeButton: rButton, startButton: tButton, playerLabels: playerLabels)
        
        positionPlayerLabels()
       
    }
    
    private func positionPlayerLabels() {
        let labels = UIElements.playerLabels
        let playerCount = labels.count
        
        guard playerCount > 0 else { return }
        
        let topBorder = view.safeAreaInsets.top + 85
        let bottomBorder = view.safeAreaInsets.bottom + 90
        let availableHeight = view.frame.height - topBorder - bottomBorder
        
        let gap: CGFloat = 5
        let maxHeight: CGFloat = 50
        
        // Compute ideal height per label (including gaps)
        let blockHeight = availableHeight / CGFloat(playerCount)
        let labelHeight = min(maxHeight, blockHeight - gap * 2)
        
        var currentY = topBorder + gap
        
        for label in labels {
            // Always set the frame directly → avoids center mismatch
            label.frame = CGRect(
                x: label.frame.origin.x,
                y: currentY,
                width: label.frame.width,
                height: labelHeight
            )
            
            currentY += blockHeight
        }
    }
    
    private func updateUI(phase: GamePhase) {
        if C.debugApp { print("Updating UI with phase: \(phase)") }
        switch phase {
        case .settingTeams:
            UIElements.redTeamButton?.container.isHidden = true
            UIElements.blueTeamVButton?.container.isHidden = true
            UIElements.redTeamButton?.container.alpha = 0.0
            UIElements.blueTeamVButton?.container.alpha = 0.0
            UIElements.redTeamButton?.container.isUserInteractionEnabled = false
            UIElements.blueTeamVButton?.container.isUserInteractionEnabled = false
        case .instructions, .playing:
            UIElements.instructionView.isHidden = false
            if phase == .playing {
                UIElements.instructionView.removeFromSuperview()
            }
            UIElements.redTeamButton?.container.alpha = 0.0
            UIElements.blueTeamVButton?.container.alpha = 0.0
            UIElements.instructionView.alpha = 0.0
            UIView.animate(withDuration: 0.2) { [self] in
                UIElements.redView.alpha = 0.0
                UIElements.blueView.alpha = 0.0
                UIElements.instructionView.alpha = 1.0
                UIElements.redHeader.alpha = 0.0
                UIElements.blueHeader.alpha = 0.0
                UIElements.startButton.alpha = 0.0
                UIElements.randomizeButton.alpha = 0.0
                UIElements.redTeamButton?.container.alpha = 1.0
                UIElements.blueTeamVButton?.container.alpha = 1.0
                UIElements.redHeader.alpha = 0.0
                UIElements.blueHeader.alpha = 0.0
                for label in UIElements.playerLabels {
                    label.alpha = 0.0
                }
                if phase == .instructions {
                    UIElements.backGroundImage.alpha = 0.5
                } else {
                    UIElements.backGroundImage.alpha = 1.0
                }
            } completion: { [self] _ in
                UIElements.redView.removeFromSuperview()
                UIElements.blueView.removeFromSuperview()
                UIElements.redHeader.removeFromSuperview()
                UIElements.blueHeader.removeFromSuperview()
                UIElements.startButton.removeFromSuperview()
                UIElements.randomizeButton.removeFromSuperview()
                UIElements.redHeader.removeFromSuperview()
                UIElements.blueHeader.removeFromSuperview()
                for label in UIElements.playerLabels {
                    label.removeFromSuperview()
                }
            }
        default: return
        }
    }

}

//MARK: - Only for debugging beloew this point

extension TeamView {
    
    private func checkGameConfiguration() {
        print("--GAME CONFIGURATION:--")
        print("Players: \(gameConfiguaration.players) total: \(gameConfiguaration.players.count)")
        print("Counting points: \(gameConfiguaration.countPoints)")
        print("Is shorter round: \(gameConfiguaration.shorterRound)")
    }
    
}
