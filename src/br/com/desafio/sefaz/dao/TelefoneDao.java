package br.com.desafio.sefaz.dao;

import java.util.List;

import javax.persistence.EntityManager;

import br.com.desafio.sefaz.model.Telefone;
import br.com.desafio.sefaz.util.ConnectionDB;

public class TelefoneDao {
	
	private EntityManager em;
	
	public TelefoneDao() {
		em = ConnectionDB.getConnectionDB();
	}
	
	public void inserir(Telefone telefone) {

		try {
			
			em.getTransaction().begin();
			em.persist(telefone);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Insert: " + e.getMessage());
		}
	}
	
	public void atualizar(Telefone telefone) {
		
		try {

//			Telefone telefoneAtualizado = em.find(Telefone.class, telefone.getId());
//
//			telefoneAtualizado.setDdd(telefone.getDdd());
//			telefoneAtualizado.setNumero(telefone.getNumero());
//			telefoneAtualizado.setTipo(telefone.getTipo());
			
			em.getTransaction().begin();
			em.merge(telefone);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Upadate: " + e.getMessage());
		}
	}
	
	public void excluir(long id) {
		
		try {
			
			em.getTransaction().begin();
			
			Telefone telefone = em.find(Telefone.class, id);
			em.remove(telefone);
			
			em.getTransaction().commit();
			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Delete: " + e.getMessage());
		}
	}
	
	public Telefone procurarPorId(long id) {
		
		Telefone telefone = null;
		
		try {
			em.getTransaction().begin();
			
			telefone = em.find(Telefone.class, id);
			
			em.getTransaction().commit();			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Search: " + e.getMessage());
		}
		return telefone;
	}
	
	@SuppressWarnings("unchecked")
	public List<Telefone> listarTelefonesPorUsuario(long usuarioId) {
		
		List<Telefone> telefones = null;
		
		try {
			em.getTransaction().begin();
			
			telefones = em.createQuery("from Telefone WHERE usuario_id = :usuario_id")
					.setParameter("usuario_id", usuarioId)
					.getResultList();
			
			em.getTransaction().commit();
				
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("List: " + e.getMessage());
		}
		return telefones;
	}
}
