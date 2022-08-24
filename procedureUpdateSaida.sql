delimiter //
create procedure updateSaida(in registroId int)
    begin 
        update registro set saida = current_timestamp() where saida is null and registro.id = registroId and date(entrada) = curdate();
    end//
delimiter ;

-- Talvez seja melhor pegar pelo id do cartão
-- "O usuário passaria o cartão, o sistema retornaria o id do mesmo e por 
-- meio desse id a procedure ia dar update"

drop procedure saidaUser;
call saidaUser(1);