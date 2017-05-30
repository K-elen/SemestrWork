package repository;

import model.Link;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LinkRepository extends JpaRepository<Link, Integer> {

    @Query("Select pt from Link pt where pt.login = :searchTerm")
    Page<Link> findAll(@Param("searchTerm") String searchTerm, Pageable pageable);

}
