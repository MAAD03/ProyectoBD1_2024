package com.bd1_2024.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.bd1_2024.entity.VistaMenusPorRol;

public interface VistaMenusPorRolRepository extends JpaRepository<VistaMenusPorRol, Long> {
    List<VistaMenusPorRol> findByIdRol(Long idRol);

}
