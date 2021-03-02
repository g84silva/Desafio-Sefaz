package br.com.desafio.sefaz.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConnectionDB {
	
	public static EntityManagerFactory emf;
	
	@SuppressWarnings("unused")
	private static EntityManager em;
	
	public static EntityManager getConnectionDB() {
		
		if(emf == null) {
			emf = Persistence.createEntityManagerFactory("hibernatejpa");
		}
		return emf.createEntityManager();
	}

}
