-- import 'CCNode.lua' as CCNode



-- macro rennder(data,name,parent,define)
	-- if data.customClass and data.customClass != ""
{{'\t'}}{{define}}{{name}} = require("app.scenes.{{ data.customClass }}").new()
	-- else
{{'\t'}}{{define}}{{name}} = cc.ParticleSystemQuad:create()

{{'\t'}}{{name}}:setTexture({{CCNode.rennder_texture(data.properties.texture)}});
{{'\t'}}{{name}}:setBlendAdditive(true);
{{'\t'}}{{name}}:setTotalParticles({{data.properties.totalParticles}});

{{'\t'}}{{name}}:setDuration({{data.properties.duration}});
{{'\t'}}{{name}}:setEmissionRate({{data.properties.emissionRate}});
{{'\t'}}{{name}}:setEmitterMode({{data.properties.emitterMode}});
{{'\t'}}{{name}}:setEndColor({{CCNode.rennder_c4f(data.properties.endColor[0])}});
{{'\t'}}{{name}}:setEndColorVar({{CCNode.rennder_c4f(data.properties.endColor[1])}});
{{'\t'}}{{name}}:setStartColor({{CCNode.rennder_c4f(data.properties.startColor[0])}});
{{'\t'}}{{name}}:setStartColorVar({{CCNode.rennder_c4f(data.properties.startColor[1])}});

{{'\t'}}{{name}}:setPosVar({{CCNode.rennder_p2(data.properties.posVar)}});

		-- if data.properties.emitterMode == 0
{{'\t'}}{{name}}:setGravity({{CCNode.rennder_p2(data.properties.gravity)}});
{{'\t'}}{{name}}:setSpeed({{data.properties.speed[0]}});
{{'\t'}}{{name}}:setSpeedVar({{data.properties.speed[1]}});
{{'\t'}}{{name}}:setTangentialAccel({{data.properties.tangentialAccel[0]}});
{{'\t'}}{{name}}:setTangentialAccelVar({{data.properties.tangentialAccel[1]}});
{{'\t'}}{{name}}:setRadialAccel({{data.properties.radialAccel[0]}});
{{'\t'}}{{name}}:setRadialAccelVar({{data.properties.radialAccel[1]}});
		-- else
{{'\t'}}{{name}}:setStartRadius({{data.properties.startRadius[0]}});
{{'\t'}}{{name}}:setStartRadiusVar({{data.properties.startRadius[1]}});
{{'\t'}}{{name}}:setEndRadius({{data.properties.endRadius[0]}});
{{'\t'}}{{name}}:setEndRadiusVar({{data.properties.endRadius[1]}});
{{'\t'}}{{name}}:setRotatePerSecond({{data.properties.rotatePerSecond[0]}});
{{'\t'}}{{name}}:setRotatePerSecondVar({{data.properties.rotatePerSecond[1]}});
		-- endif
{{'\t'}}{{name}}:setLife({{data.properties.life[0]}});
{{'\t'}}{{name}}:setLifeVar({{data.properties.life[1]}});
{{'\t'}}{{name}}:setStartSize({{data.properties.startSize[0]}});
{{'\t'}}{{name}}:setStartSizeVar({{data.properties.startSize[1]}});
{{'\t'}}{{name}}:setEndSize({{data.properties.endSize[0]}});
{{'\t'}}{{name}}:setEndSizeVar({{data.properties.endSize[1]}});
{{'\t'}}{{name}}:setStartSpin({{data.properties.startSpin[0]}});
{{'\t'}}{{name}}:setStartSpinVar({{data.properties.startSpin[1]}});
{{'\t'}}{{name}}:setEndSpin({{data.properties.endSpin[0]}});
{{'\t'}}{{name}}:setEndSpinVar({{data.properties.endSpin[1]}});
{{'\t'}}{{name}}:setAngle({{data.properties.angle[0]}});
{{'\t'}}{{name}}:setAngleVar({{data.properties.angle[1]}});
	-- endif
{{ CCNode.rennder_base_properties(name,data.properties,parent) }}
-- endmacro 