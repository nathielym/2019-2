package com.example.app.negocio;

import com.example.app.negocio.dominio.ClienteDTO;
import com.example.app.negocio.excecao.NomeMenorCincoCaracteresException;
import com.example.app.negocio.excecao.ObjetoJaExisteException;
import com.example.app.negocio.excecao.PaisNaoDefinidoException;;
import com.example.app.persistencia.ClienteDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.HashSet;
import java.util.Set;

@RequiredArgsConstructor
@Service
public class ClienteNegocio implements INegocio<ClienteDTO>{

    private Set<ClienteDTO> lista;

    private final ClienteDAO clienteDAO;

    public ClienteNegocio() {
        lista = new HashSet<>();
    }

    @Override
    public void incluir(ClienteDTO cliente) throws ObjetoJaExisteException, NomeMenorCincoCaracteresException, PaisNaoDefinidoException{
        if ((cliente.getPais()).equals(""))
        	throw new PaisNaoDefinidoException();
        if (((cliente.getNome()).length() < 5))
        	throw new NomeMenorCincoCaracteresException();
    	if (clienteDAO.findByNome(cliente.getNome()).isPresent())
            throw new ObjetoJaExisteException();
        
        clienteDAO.save(ClienteDTO.EntityFromDTO(cliente));
    }

    @Override
    public Set<ClienteDTO> listar() {
        return ClienteDTO.DTOsFromEntities(ClienteDAO.findAll());
    }
}
