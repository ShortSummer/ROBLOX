local t = {
  ["Version"] = 1
  ["ValidReturns"] = {}
}

local alphabet = {}

for i=97, 122 do
	local char = utf8.char(i)
	table.insert(alphabet, char)
end
function getRandomString(len, used)
  local alrUsed = true
  local randString = ""
  repeat
    randString = ""
    alrUsed = false
    for i=1, len do
        rand = math.random(1, #alphabet)
        randString = randString..alphabet[rand]
        if i == len then
          for i, v in used do
            if v == randString then
              alrUsed = true
            end
        end
    end
  until alrUsed == false
  return randString
end
local UsedStrings = {}
for i=1, 1000 do
    local rande = getRandomString(60, UsedStrings)
    table.append(t["ValidReturns"], rande)
    table.append(UsedStrings, rande)
end

return t
