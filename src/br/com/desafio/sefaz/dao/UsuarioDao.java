package br.com.desafio.sefaz.dao;

import java.util.List;

import javax.persistence.EntityManager;
import br.com.desafio.sefaz.model.Usuario;
import br.com.desafio.sefaz.util.ConnectionDB;

public class UsuarioDao {
	
	private EntityManager em;
	
	public UsuarioDao() {
		em = ConnectionDB.getConnectionDB();
	}
	
	public void inserir(Usuario usuario) {

		try {
			
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Insert: " + e.getMessage());
		}
	}
	
	public void atualizar(Usuario usuario) {
		
		try {

			em.getTransaction().begin();
			em.merge(usuario);
			em.getTransaction().commit();

		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Upadate: " + e.getMessage());
		}
	}
	
	public void excluir(long id) {
		
		try {
			
			em.getTransaction().begin();
			
			Usuario usuario = em.find(Usuario.class, id);
			
			em.remove(usuario);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Delete: " + e.getMessage());
		}
	}
	
	public Usuario procurarPorId(long id) {
		
		Usuario usuario = null;
		
		try {
			
			em.getTransaction().begin();
			
			usuario = em.find(Usuario.class, id);
			
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Search: " + e.getMessage());
		}
		
		return usuario;
	}
	
	@SuppressWarnings("unchecked")
	public List<Usuario> listarTodos() {
		
		List<Usuario> usuarios = null;
		
		try {
			em.getTransaction().begin();
			usuarios = em.createQuery("from Usuario").getResultList();
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("List: " + e.getMessage());
		} 
		
		return usuarios;
	}

	public Usuario validar(String email, String senha) {
		
		Usuario usuario = null;
		
		try {
			em.getTransaction().begin();
			usuario = (Usuario) em.createQuery("FROM Usuario WHERE email = :email")
					.setParameter("email", email)
					.getSingleResult();
			em.getTransaction().commit();
			
			if (usuario != null && usuario.getSenha().equals(senha)) {
				return usuario;
			} else {
				return null;
			}
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("List: " + e.getMessage());
			return null;
		}
		
		
	}
	
}
