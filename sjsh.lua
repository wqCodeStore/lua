-- 需要的元素
-- 1.倒计时  和天上的陨石同步 定时器结束，陨石也落地 砸向终点 游戏结束
-- 2.胜利条件  在获得100积分后到达终点处  终点位置随机
-- 3.随机水果  会发红光，会有提示  50积分( 50% ) or 扣一半血，减速50%继续三秒触发(20%) or 没什么用的光环(30%)  每10秒出现一次
-- 一秒调用一次生成方法  
-- 4.正常水果   葡萄 苹果 香蕉  西瓜   70%

grape = {
    score:10,
    hp:0,
    speed:10,
    probability:40%
}
apple = {
    score:10,
    hp:10,
    probability:15%
}
banana = {
    score:20,
    hp:20,
    speed:20,
    probability:10%
}
watermelon = { 
    score:30,
    hp:30,
    probability:5%
}
-- 坏东西  30%
-- 烂香蕉 冰块  石头  毒药
rotBanana = {
    probability:10%,
    speed:-10,
    hp:-10,
    
}
ice = {
    probability:10%,
    speed:-30%,
}
rock = {
    probability:5%,
    hp:-20,
    score:-10
}

bane = {
    probability:5%,
    hp:-100%,
    color:紫色  //发着黑紫光芒 
}


=====================
local gameTime = 100  -- 总游戏时间
local scoreTotal = 0  -- 总积分
local startY = 12  --  初始高度
-- 初始移动速度是 4
math.randomseed(tostring(os.time()):reverse():sub(1, 7))
local partList = {
    apple = {
        name="apple",
        score=10,
        hp=0,
    },
    grape = {
        name="grape",
        score=10,
        hp=10,
        speed=6,
       
    },
    banana = {
        name = "banana",
        score=20,
        hp=20,
        speed=8,
    },
    watermelon = { 
        name = "watermelon",
        score=30,
        hp=30
    },
    -- 坏东西  30%
    -- 烂香蕉 冰块  石头  毒药
    rotBanana = {
        name = "rotBanana",
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
        score= -10
    },
    -- 致死
    bane = {
        name = "bane",
        hp = 0
    }
}
local function createPart()
    local ranNum =  math.random(1,100)
    local temp = ''
    if ranNum < 40 then
        temp =  partList.apple
    elseif ranNum < 55 then
        temp = partList.grape
    elseif ranNum < 65 then
        temp = partList.banana
    elseif ranNum < 70 then
        temp = partList.watermelon
    elseif ranNum < 80 then
        temp = partList.rotBanana
    elseif ranNum < 90 then
        temp = partList.ice
    elseif ranNum < 95 then
        temp = partList.rock
    elseif ranNum <= 100 then
        temp = partList.bane
    end
    print("生成的水果是:",temp.name)
end
local createrPartTimer = RWTimer:Create(createPart,1,100)
createrPartTimer:Start()