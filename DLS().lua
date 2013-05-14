--作为扩展插件导入谷歌拼音输入法即可, 在候选词转换器中开启
_BRACKETS = {
  [0] = "(",
	[1] = ")",
	[2] = "[",
	[3] = "]",
	[4] = "{",
	[5] = "}",
	[6] = "<",
	[7] = ">",
	[[全角字符好烦人! 不管他们了
	[8] = "（",
	[9] = "）",
	[10] = "【",
	[11] = "】",
	[12] = "『 ",
	[13] = "』",
	[14] = "《",
	[15] = "》",]]
}
function AddGoodBrackets(text)
	local res = ""
	res = "(" .. text:sub(1,#text) .. ")"
	return res
end
function AddBadBrackets(text)
	local res = ""
	res = ")" .. text:sub(1,#text) .. "("
	return res
end
function AddRandomBrackets(text)
	local res = ""
	local i = 1
	while i <= #text do
		if text:byte(i, i)<128 then
			if math.random (0,14) < 2 then
				res = res .. text:sub(i, i) .. _BRACKETS[math.random (0,7)]
				i = i + 1
			else
				res = res .. text:sub(i, i)
				i = i + 1
			end
		else
			if math.random (0,9) < 2 then
				res = res .. text:sub(i, i + 2) .. _BRACKETS[math.random (0,7)]
				i = i + 3
			else
				res = res .. text:sub(i, i + 2)
				i = i + 3
			end
		end
	end
	return res
end
ime.register_converter("AddGoodBrackets", "为善无近名")
ime.register_converter("AddBadBrackets", "为恶无近刑")
ime.register_converter("AddRandomBrackets", "缘督以为经")
