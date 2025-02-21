package com.hab.logica;

import com.hab.logica.Ciudadano;
import com.hab.logica.EstadoTurno;
import com.hab.logica.TipoTramite;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2025-02-20T19:44:09")
@StaticMetamodel(Turno.class)
public class Turno_ { 

    public static volatile SingularAttribute<Turno, Integer> numeroTurno;
    public static volatile SingularAttribute<Turno, EstadoTurno> estadoTurno;
    public static volatile SingularAttribute<Turno, Date> fecha;
    public static volatile SingularAttribute<Turno, Long> id;
    public static volatile SingularAttribute<Turno, TipoTramite> tipoTramite;
    public static volatile SingularAttribute<Turno, Ciudadano> ciudadano;

}