-- 陨石快砸下来了，尽快攒够能量逃离
math.randomseed(tostring(os.time()):reverse():sub(1, 7))
local gameTime = 100  -- 总游戏时间
local createrPartTimer --创建水果的定时器
-- 游戏倒计时定时器  
local countDownTimer 
local energyTotal = 0  -- 总能量
local isWin = false
local partX = ''
local startY = 12  --  初始高度
local partZ = ''
-- 终点   x 区间 -10 10  z -10 10 
local destinationX =  math.random(-10,10)
local destinationZ =  math.random(-10,10)
local destination = script.Parent.destination
destination.Position = Vector3.New(destinationX,0.0415,destinationZ)
destination.Anchored = true
destination.TriggerEnter:Connect(function(res)
--		
	if res:IsClass("Avatar") and energyTotal >=100 then
--		print("赢得游戏")
		-- 客户端提示
		MessageEvent.FireClient(res.PlayerId,"gameWin")
		-- 清除水果生成
		createrPartTimer:Stop()
	end
end)

-- 陨石
local aerolite = script.Parent.aerolite
local partList = {
    apple = {
        name="apple",
        energy=10,
		speed=6
    },
    grape = {
        name="grape",
        energy=10,
        hp=10,
        speed=6,
       
    },
    banana = {
        name = "banana",
        energy=20,
        hp=20,
        speed=8,
    },
    watermelon = { 
        name = "watermelon",
        energy=30,
        hp=30
    },
    -- 坏东西  30%
    -- 蓝莓 冰块  石头  毒药
    blueberry = {
        name = "blueberry",
        speed=2.5,
        hp= -10,
        
    },
    ice = {
        name = "ice",
        speed=2,
    },
    rock = {
        name = "rock",
        hp=-20,
        energy= -10
    },
    -- 致死
    bane = {
        name = "bane",
        hp = 0
    }
}
local tweenInfo = 
{
    duration = gameTime*1000,--时长/ms
    repeatCount = 1,--重复次数，-1是无限
    easing = "inSine",--动画播放类型
    yoyo = false,--动画循环类型
    delay = 1500,--开始播放前的等待时间
}

local action = {
    Position = Vector3.New(destinationX, 0, destinationZ), 
    Color = Vector3.New(255, 0, 0),
    Transparency = 1
}

local function reSetAttr(attrs,temp)
	return function (res)
        if res:IsClass("Avatar") then
            -- 接触毒药，直接致死
			local uid = res.PlayerId
            if attrs.name =="bane" then
                isWin = false
                -- 清除水果生成
                createrPartTimer:Stop()
				MessageEvent.FireClient(uid,"changeEnergy",energyTotal)
				MessageEvent.FireClient(uid,"changeTimer",0)
                return res:BeKilled()
			else
				 -- 人碰到直接消失
				temp:Destroy()
            end
			if attrs.name =="rock" or attrs.name =="ice" then
				res:Jump()
			end
            -- 如果有能量
            if attrs.energy then
                energyTotal = energyTotal + attrs.energy
				
				MessageEvent.FireClient(uid,"changeEnergy",energyTotal)
                if energyTotal>=100 then
                    -- 能量到达100 能量达到条件
                    isWin = true    
                end
                
            end
            -- 如果有hp
            if attrs.hp then
                res.Health = res.Health + attrs.hp
            end
            -- 如果有速度
            if attrs.speed then
              
                res.MoveSpeed = attrs.speed
                wait(3) -- 三秒后恢复原速度
                res.MoveSpeed  = 4
            end
           
        else 
            wait(5) -- 接触地面后五秒后删除
            temp:Destroy()
		end
		
	end
end
local function createPart()
    local ranNum =  math.random(1,100)
    local attrs = ''
	local temp = ''
	partX = math.random(-10,10)
	partZ = math.random(-10,10)
    if ranNum < 40 then
        attrs =  partList.apple
    elseif ranNum < 55 then
        attrs = partList.grape
    elseif ranNum < 65 then
        attrs = partList.banana
    elseif ranNum < 70 then
        attrs = partList.watermelon
    elseif ranNum < 80 then
        attrs = partList.blueberry
    elseif ranNum < 90 then
        attrs = partList.ice
    elseif ranNum < 95 then
        attrs = partList.rock
    elseif ranNum <= 100 then
        attrs = partList.bane
    end
	-- print("生成的水果是:",attrs.name)
	temp = script.Parent[attrs.name]:Clone()
	temp.Position = Vector3.New(partX,startY,partZ)
    temp.Anchored = false -- 取消锚定
    temp.Transparency = 1
	temp.TriggerEnter:Connect(reSetAttr(attrs,temp))
end

createrPartTimer = RWTimer:Create(createPart,1,100)
countDownTimer = RWTimer:Create(function()
    gameTime = gameTime -1
end,1,100)

-- 生成水果
createrPartTimer:Start()
-- 开始计时
countDownTimer:Start()
-- 陨石动画开始
local tween = TweenServiceJS:CreateTween(aerolite, tweenInfo,action)
tween:Play()
tween:OnComplete(function()
	
end)
