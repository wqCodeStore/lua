-- ��Ҫ��Ԫ��
-- 1.����ʱ  �����ϵ���ʯͬ�� ��ʱ����������ʯҲ��� �����յ� ��Ϸ����
-- 2.ʤ������  �ڻ��100���ֺ󵽴��յ㴦  �յ�λ�����
-- 3.���ˮ��  �ᷢ��⣬������ʾ  50����( 50% ) or ��һ��Ѫ������50%�������봥��(20%) or ûʲô�õĹ⻷(30%)  ÿ10�����һ��
-- һ�����һ�����ɷ���  
-- 4.����ˮ��   ���� ƻ�� �㽶  ����   70%

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
-- ������  30%
-- ���㽶 ����  ʯͷ  ��ҩ
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
    color:��ɫ  //���ź��Ϲ�â 
}


=====================
local gameTime = 100  -- ����Ϸʱ��
local scoreTotal = 0  -- �ܻ���
local startY = 12  --  ��ʼ�߶�
-- ��ʼ�ƶ��ٶ��� 4
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
    -- ������  30%
    -- ���㽶 ����  ʯͷ  ��ҩ
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
    -- ����
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
    print("���ɵ�ˮ����:",temp.name)
end
local createrPartTimer = RWTimer:Create(createPart,1,100)
createrPartTimer:Start()