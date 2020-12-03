using prueba.Entities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace prueba.DataAccess
{
    [DbConfigurationType(typeof(MySql.Data.Entity.MySqlEFConfiguration))]
    public class pruebaDbContext : DbContext
    {
        public pruebaDbContext() 
            : base("name=pruebaDbContext")
        {
            
        }

        public DbSet<maestro> maestros { get; set; }
        public DbSet<Grupo> Grupos { get; set; }
        public DbSet<Alumno> Alumnos { get; set; }
        public DbSet<Actividad> Actividades { get; set; }
        public DbSet<Asistencia> Asistencias { get; set; }
        public DbSet<Comentario> Comentarios { get; set; }

        /*tablas resultantes de N:N*/
        public DbSet<Mensaje_alumno_maestro> Mensaje_alumno_maestros { get; set; }
        public DbSet<Alumno_actividad> Alumno_actividades { get; set; }
        public DbSet<Grupo_alumno> Grupo_alumnos { get; set; }



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            //me permite formar una PK con dos coumnas de una relacion N:N
            modelBuilder.Entity<Grupo_alumno>().HasKey(x => new { x.Id_alumno, x.Id_grupo });
            modelBuilder.Entity<Alumno_actividad>().HasKey(x=> new {x.Id_alumno, x.Id_actividad });
            modelBuilder.Entity<Mensaje_alumno_maestro>().HasKey(x=> new {x.Id_alumno,x.Id_maestro,x.Id_mensaje });
            modelBuilder.Entity<Asistencia>().HasKey(x => new { x.Id_alumno, x.Fecha });

            base.OnModelCreating(modelBuilder);
        }
    }
}
