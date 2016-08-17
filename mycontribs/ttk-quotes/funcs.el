; -*- coding:utf-8-unix mode:emacs-lisp -*-
;;***************************************************************************************
;;
;; 2016 Totok Sulistiomono
;; stotok@kukisku.com
;;
;;***************************************************************************************

;;
;; Define quotes
;;

(defvar quotes
  '("There are approximately 100,000 hairs on average human head."
    "At any given moment, about 0.7%% of the people in the world are drunk."
    "It takes an average person 7 minutes to fall asleep."
    "If you can't explain it simply, you don't understand it well enough."
    "The world is changed by examples, not by opinions."
    "When you talk, you spray around 2.5 microscopic saliva droplets per word."
    "An apple in the morning will keep you more awake than a cup of coffee."
    "You miss 100%% of the shots you never take."
    "To the man who only has a hammer, everything he encounters begins to look like a nail."
    "We are what we repeatedly do; excellence, then, is not an act but a habit."
    "A wise man gets more use from his enemies than a fool from his friends."
    "I’d rather live with a good question than a bad answer."
    "Imitation is suicide."
    "Do what you must, and your friends will adjust."
    "I wish I was an octopus, so I can slap eight people at once."
    "Doing nothing is hard, you never know when you're done."
    "When nothing is going right, go left."
    "After (M)onday and (T)uesday comes WTF!"
    "I could agree with you, but then we'd both be wrong."
    "I hear and I forget, I see and I remember. I do and I understand."
    "Every accomplishment starts with the decision to try."
    "Rule#1: There's always a dame."
    "Rule#2: Someone always gets hurt."
    "Rule#3: Reality is stranger than fiction."
    "Love is like war, easy to begin but hard to end."
    "Opportunity does not knock, it presents itself when you beat down the door."
    "A diamond is merely a lump of coal that did well under pressure."
    "Action speaks louder than words."
    "Design for the future, because it will be here sooner than you think."
    "Repair what you can but when you must fail, fail noisily and as soon as possible."
    "Too much agrement kills a chat."
    "Don't talk about yourself; it will be done when you leave."
    "Laziness is nothing more than the habit of resting before you get tired."
    "When we talk to God, we're praying. When God talks to us, we're schizophrenic."
    "In the Beginning ... Was the command Line."
    "Life is 10%% what happens to you and 90%% how you react to it."
    "The secret of getting ahead is getting started."
    "Clarity is better than cleverness."
    "When in doubt, use brute force."
    "It's better to solve the right problem the wrong way rather than the wrong problem the right way."
    "Teachers open the door. You enter by yourself."
    "Rome was not built in a day, neither in a thousand years."
    "Never trust a man when he's in love, drunk, or running for office."
    "User: the word computer professionals use when they mean \"idiot\"."
    "Don't wish it were easier, wish you were better."
    "Remind yourself that 'done is better than perfect.'"))

;;
;; This function will be called by spacemacs at startup.
;; Display quotes randomly in the minibuffer during startup
;;
(defun display-startup-echo-area-message ()
  (message (nth (random (length quotes)) quotes)))

;; EOF
