
local Particle_layout = class("Particle_layout",function()
    return display.newLayer()
end)





function Particle_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	local ccparticlesystemquad_1 = cc.ParticleSystemQuad:create()

	ccparticlesystemquad_1:setTexture(cc.Director:getInstance():getTextureCache():addImage("ccbParticleSmoke.png"));
	ccparticlesystemquad_1:setBlendAdditive(true);
	ccparticlesystemquad_1:setTotalParticles(500);

	ccparticlesystemquad_1:setDuration(-1);
	ccparticlesystemquad_1:setEmissionRate(10);
	ccparticlesystemquad_1:setEmitterMode(1);
	ccparticlesystemquad_1:setEndColor(cc.c4f(1,0.4309,0.3161,0.01));
	ccparticlesystemquad_1:setEndColorVar(cc.c4f(0.0,0.0,0.0,0.0));
	ccparticlesystemquad_1:setStartColor(cc.c4f(1,1,1,0.2));
	ccparticlesystemquad_1:setStartColorVar(cc.c4f(0.0,0.0,0.0,0.0));

	ccparticlesystemquad_1:setPosVar(cc.p(0.0,0.0));

	ccparticlesystemquad_1:setStartRadius(50);
	ccparticlesystemquad_1:setStartRadiusVar(0.0);
	ccparticlesystemquad_1:setEndRadius(150);
	ccparticlesystemquad_1:setEndRadiusVar(50);
	ccparticlesystemquad_1:setRotatePerSecond(360);
	ccparticlesystemquad_1:setRotatePerSecondVar(20);
	ccparticlesystemquad_1:setLife(2);
	ccparticlesystemquad_1:setLifeVar(0.25);
	ccparticlesystemquad_1:setStartSize(35);
	ccparticlesystemquad_1:setStartSizeVar(10);
	ccparticlesystemquad_1:setEndSize(0.0);
	ccparticlesystemquad_1:setEndSizeVar(0.0);
	ccparticlesystemquad_1:setStartSpin(0.0);
	ccparticlesystemquad_1:setStartSpinVar(0.0);
	ccparticlesystemquad_1:setEndSpin(0.0);
	ccparticlesystemquad_1:setEndSpinVar(0.0);
	ccparticlesystemquad_1:setAngle(0.0);
	ccparticlesystemquad_1:setAngleVar(0.0);
	ccparticlesystemquad_1:setBlendFunc(1, 1)
	ccparticlesystemquad_1:ignoreAnchorPointForPosition(false)
	ccparticlesystemquad_1:setAnchorPoint(cc.p(0.0,0.0))
	ccparticlesystemquad_1:setPosition(cc.p(self:getContentSize().width * 0.63, self:getContentSize().height * 0.5))

	self:addChild(ccparticlesystemquad_1)

	local ccparticlesystemquad_2 = cc.ParticleSystemQuad:create()

	ccparticlesystemquad_2:setTexture(cc.Director:getInstance():getTextureCache():addImage("ccbParticleSmoke.png"));
	ccparticlesystemquad_2:setBlendAdditive(true);
	ccparticlesystemquad_2:setTotalParticles(250);

	ccparticlesystemquad_2:setDuration(-1);
	ccparticlesystemquad_2:setEmissionRate(20);
	ccparticlesystemquad_2:setEmitterMode(0);
	ccparticlesystemquad_2:setEndColor(cc.c4f(0.0,0.0,0.0,0.01));
	ccparticlesystemquad_2:setEndColorVar(cc.c4f(0.0,0.0,0.0,0.0));
	ccparticlesystemquad_2:setStartColor(cc.c4f(1,1,1,0.2));
	ccparticlesystemquad_2:setStartColorVar(cc.c4f(0.0,0.0,0.0,0.0));

	ccparticlesystemquad_2:setPosVar(cc.p(40,40));

	ccparticlesystemquad_2:setGravity(cc.p(0.0,0.0));
	ccparticlesystemquad_2:setSpeed(60);
	ccparticlesystemquad_2:setSpeedVar(20);
	ccparticlesystemquad_2:setTangentialAccel(0.0);
	ccparticlesystemquad_2:setTangentialAccelVar(0.0);
	ccparticlesystemquad_2:setRadialAccel(0.0);
	ccparticlesystemquad_2:setRadialAccelVar(0.0);
	ccparticlesystemquad_2:setLife(3);
	ccparticlesystemquad_2:setLifeVar(0.25);
	ccparticlesystemquad_2:setStartSize(35);
	ccparticlesystemquad_2:setStartSizeVar(10);
	ccparticlesystemquad_2:setEndSize(0.0);
	ccparticlesystemquad_2:setEndSizeVar(0.0);
	ccparticlesystemquad_2:setStartSpin(0.0);
	ccparticlesystemquad_2:setStartSpinVar(0.0);
	ccparticlesystemquad_2:setEndSpin(0.0);
	ccparticlesystemquad_2:setEndSpinVar(0.0);
	ccparticlesystemquad_2:setAngle(90);
	ccparticlesystemquad_2:setAngleVar(10);
	ccparticlesystemquad_2:setBlendFunc(1, 1)
	ccparticlesystemquad_2:ignoreAnchorPointForPosition(false)
	ccparticlesystemquad_2:setAnchorPoint(cc.p(0.0,0.0))
	ccparticlesystemquad_2:setPosition(cc.p(self:getContentSize().width * 0.29, self:getContentSize().height * 0.5))

	self:addChild(ccparticlesystemquad_2)


end



return Particle_layout