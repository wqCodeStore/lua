local parent2D = script.Parent
-- 要写  与服务端通信，重新开始游戏
parent2D.AnchoredPosition = Vector2(-830,260)
local energy = script.Parent.energyShow -- 分数文本控件
local coutDown = script.Parent.countDown
local coutDownNum = 100
local countDwomTimer
local gameControl = script.Parent.gameControl
-- 重新开始按钮
local reGame = script.Parent.reGame
-- 要么成功，要么失败
local function showContril()
	--print("展示信息")
	countDwomTimer:Stop()
	for _,uis in pairs(script.Parent:GetAllChild()) do
		if uis:IsClass("UiText") then
			uis.IsVisable = false
		end
	end
	gameControl.IsVisable = true
end

local function countDownReduce()
	coutDownNum = coutDownNum - 1
	if coutDownNum<=0 then
--		print("接收到死亡")
		showContril()
	else
		coutDown.Text = coutDownNum.."s"
	end
	
end

MessageEvent.ClientEventCallBack("changeEnergy"):Connect(function(energyTotal)
    energy.Text = energyTotal--文本为接收到的分数
end)
MessageEvent.ClientEventCallBack("changeTimer"):Connect(function(time)
	
	coutDownNum = time
    coutDown.Text = time--文本为接收到的倒计时
end)
MessageEvent.ClientEventCallBack("gameWin"):Connect(function()
    gameControl.Text = "恭喜通关！"
    gameControl.TextColor = Vector3.New(0,255,0)
--	print("接收到通关：")
	showContril()
end)

countDwomTimer = RWTimer:Create(countDownReduce,1,100)
countDwomTimer:Start()

