package ejemplo03.presentacion;

import com.fpmislata.persistencia.dao.BussinessException;
import com.fpmislata.persistencia.dao.BussinessMessage;
import ejemplo03.dominio.Licencia;
import ejemplo03.dominio.Local;
import ejemplo03.persistencia.dao.LocalDAO;
import ejemplo03.persistencia.dao.LicenciaDAO;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class LicenciaController {

    @Autowired
    private LicenciaDAO licenciaDAO;
    @Autowired
    private LocalDAO localDAO;

    @RequestMapping({"/listalicencias.html"})
    public ModelAndView listarLicencias(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        int id = -1;
        if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
            id = Integer.parseInt(request.getParameter("id"));
        }

        try {
            List<Licencia> licencias = licenciaDAO.findAll();
            model.put("listalicencias", licencias);
            viewName = "licenciasLista";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    ///licencias/newForInsert.html
    @RequestMapping({"/licencias/newForInsert"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {

            Licencia licencia = licenciaDAO.create();
            List<Local> locales = localDAO.findAll();

            ArrayList<Integer> ids = new ArrayList();
            if (request.getParameter("local") != null) {
                ids.add(Integer.parseInt(request.getParameter("local")));
            } else {
                for (Local local : locales) {
                    ids.add(local.getId());
                }
            }

            model.put("formOperation", FormOperation.Insert);
            model.put("licencia", licencia);
            model.put("localid", ids);
            viewName = "licencia";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/licencia/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }

        Licencia licencia = null;
        try {
            licencia = licenciaDAO.create();

            licencia.setIdLicencia(Integer.parseInt(request.getParameter("id")));
            licencia.setExpediente(Integer.parseInt(request.getParameter("expediente").trim()));
            licencia.setTitulo(request.getParameter("titulo"));
            licencia.setFechaCreacion(request.getParameter("fechaCreacion"));
            licencia.setAnyo(request.getParameter("anyo"));

            Local loc = new Local();
            loc.setId(Integer.parseInt(request.getParameter("local")));
            licencia.setLocal(loc);

            licenciaDAO.saveOrUpdate(licencia);

            viewName = "redirect:/listalicencias.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            if (licencia != null) {
                licencia.setIdLicencia(0);
            }
            model.put("licencia", licencia);
            model.put("formOperation", FormOperation.Insert);
            viewName = "licencia";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/licencia/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        Licencia licencia = null;
        try {
            int id;
            id = Integer.parseInt(request.getParameter("expediente"));
            licencia = licenciaDAO.get(id);
            if (licencia == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el profesor a borrar"));
            }
            licenciaDAO.delete(id);
            viewName = "redirect:/licencias.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("licencia", licencia);
            model.put("formOperation", FormOperation.Delete);
            viewName = "licencia";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/licencia/readForUpdate"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("expediente"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }

            Licencia licencia = licenciaDAO.get(id);
            if (licencia == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el profesor con id=" + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("licencia", licencia);
            viewName = "licencia";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/licencia/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
        Licencia licencia = null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("expediente"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido "));
            }
            licencia = licenciaDAO.get(id);
            if (licencia == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el profesor."));
            }

            licencia.setAnyo(request.getParameter("anyo"));
            licencia.setTitulo(request.getParameter("titulo"));

            licenciaDAO.saveOrUpdate(licencia);

            viewName = "redirect:/licencias.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("licencia", licencia);
            model.put("formOperation", FormOperation.Update);
            viewName = "licencia";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/licencia/readForDelete"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("expediente"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }

            Licencia licencia = licenciaDAO.get(id);
            if (licencia == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el profesor con id=" + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("licencia", licencia);
            viewName = "licencia";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

}
