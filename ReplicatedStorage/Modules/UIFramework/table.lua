
local TableH = {}

function TableH:TableHasKey(table1 : table,table2 : table)
    for i,_ in pairs(table1) do
        if (table2[i] == nil) then return false end
    end
    for i,_ in pairs(table2) do
        if (table1[i] == nil) then return false end
    end
end





return TableH