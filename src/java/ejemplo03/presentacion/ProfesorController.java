/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ejemplo03.presentacion;

import com.fpmislata.persistencia.dao.BussinessException;
import com.fpmislata.persistencia.dao.BussinessMessage;
import ejemplo03.dominio.Local;
import ejemplo03.dominio.Profesor;
import ejemplo03.dominio.Profesor;
import ejemplo03.persistencia.dao.LocalDAO;
import ejemplo03.persistencia.dao.ProfesorDAO;
import ejemplo03.persistencia.dao.ProfesorDAO;
import java.io.UnsupportedEncodingException;
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
public class ProfesorController {

    @Autowired
    private LocalDAO localDAO;

    @RequestMapping({"/index.html"})
    public ModelAndView listarProfesores(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            List<Local> local = localDAO.findAll();
            for (int i = 0; i < local.size(); i++) {
                System.out.println(local.get(i).getLicencias());
            }
            model.put("locales", local);
            viewName = "localesLista";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }
    
  

    @RequestMapping({"/locales/newForInsert"})
    public ModelAndView newForInsert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            Local local = localDAO.create();
            model.put("formOperation", FormOperation.Insert);
            model.put("locales", local);
            viewName = "locales";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/locales/readForUpdate"})
    public ModelAndView readForUpdate(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }

            Local local = localDAO.get(id);
            if (local == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el profesor con id=" + id));
            }
            model.put("formOperation", FormOperation.Update);
            model.put("local", local);
            viewName = "locales";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/locales/readForDelete"})
    public ModelAndView readForDelete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }

            Local local = localDAO.get(id);
            if (local == null) {
                throw new BussinessException(new BussinessMessage(null, "No existe el profesor con id=" + id));
            }
            model.put("formOperation", FormOperation.Delete);
            model.put("local", local);
            viewName = "locales";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("backURL", request.getContextPath() + "/index.html");
            viewName = "error";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/locales/insert.html"})
    public ModelAndView insert(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }

        Local local = null;
        try {
            local = localDAO.create();

            local.setEmplazamiento(request.getParameter("emplazamiento"));
            local.setCodigoPortal(request.getParameter("codportal"));
            local.setComentarios(request.getParameter("comentarios"));
            local.setId(Integer.parseInt(request.getParameter("id")));

            localDAO.saveOrUpdate(local);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            if (local != null) {
                local.setId(0);
            }
            model.put("locales", local);
            model.put("formOperation", FormOperation.Insert);
            viewName = "locales";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/locales/update.html"})
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
        Local local = null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }
            local = localDAO.get(id);
            if (local == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el profesor."));
            }

            local.setEmplazamiento(request.getParameter("emplazamiento"));
            local.setComentarios(request.getParameter("comentarios"));
            local.setCodigoPortal(request.getParameter("codportal"));

            localDAO.saveOrUpdate(local);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("locales", local);
            model.put("formOperation", FormOperation.Update);
            viewName = "locales";
        }

        return new ModelAndView(viewName, model);
    }

    @RequestMapping({"/locales/delete.html"})
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        Local local = null;
        try {
            int id;
            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException nfe) {
                throw new BussinessException(new BussinessMessage(null, "Se debe escribir un Id válido"));
            }
            local = localDAO.get(id);
            if (local == null) {
                throw new BussinessException(new BussinessMessage(null, "Ya no existe el profesor a borrar"));
            }

            localDAO.delete(id);

            viewName = "redirect:/index.html";
        } catch (BussinessException ex) {
            model.put("bussinessMessages", ex.getBussinessMessages());
            model.put("locales", local);
            model.put("formOperation", FormOperation.Delete);
            viewName = "locales";
        }

        return new ModelAndView(viewName, model);
    }

}
